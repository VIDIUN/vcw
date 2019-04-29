package com.vidiun.delegates {
	
	import com.vidiun.config.IVidiunConfig;
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.errors.VidiunError;
	import com.vidiun.events.VidiunEvent;
	import com.vidiun.net.VidiunCall;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.FileReference;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.utils.Timer;
	
	public class WebDelegateBase extends EventDispatcher implements IVidiunCallDelegate {
		
		private static const CONNECT_TIME : int = 120000; //60 secs
		private static const LOAD_TIME : int = 120000; //60 secs
		protected var connectTimer:Timer;
		protected var loadTimer:Timer;
		
		protected var _call:VidiunCall;
		protected var _config:VidiunConfig;
		
		protected var loader:URLLoader;
		protected var fileRef:FileReference;
		
		//Setters & getters 
		public function get call():VidiunCall { return _call; }
		public function set call(newVal:VidiunCall):void { _call = newVal; }

		public function get config():IVidiunConfig { return _config; }
		public function set config(newVal:IVidiunConfig):void { _config = newVal as VidiunConfig; }
		
		public function WebDelegateBase(call:VidiunCall = null , config:VidiunConfig = null) 
		{
			this.call = call;
			this.config = config;
			if(!call) return; //maybe a multi request
			connectTimer = new Timer(CONNECT_TIME, 1);
			connectTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onConnectTimeout);
			
			loadTimer = new Timer(LOAD_TIME, 1);
			loadTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onLoadTimeOut);
			
			execute();
		}
		
		public function close():void {
			try {
				loader.close();
			} catch (e:*) { }
			
			connectTimer.stop();
			loadTimer.stop();
		}
		
		protected function onConnectTimeout(event:TimerEvent):void {
			var vError:VidiunError = new VidiunError();
			//vError.errorCode =
			vError.errorMsg = "Connection Timeout: " + CONNECT_TIME/1000 + " sec with no post command from vidiun client.";
			_call.handleError(vError);
			dispatchEvent(new VidiunEvent(VidiunEvent.FAILED, false, false, false, null, vError));
			
			loadTimer.stop();
			close();
		}
		
		protected function onLoadTimeOut(event:TimerEvent):void {
			connectTimer.stop();
			
			close();
			
			var vError:VidiunError = new VidiunError();
			vError.errorMsg = "Post Timeout: "+ LOAD_TIME/1000 + " sec with no post result.";
			_call.handleError(vError);
			dispatchEvent(new VidiunEvent(VidiunEvent.FAILED, false, false, false, null, vError));
		}

		protected function execute():void {
			if (call == null) { throw new Error('No call defined.'); }
			post(); //post the call
		}

		/**
		 * Helper function for sending the call straight to the server
		 */
		protected function post():void {
			
			addOptionalArguments();
			
			formatRequest();
			
			sendRequest();
			
			connectTimer.start();
		}
		
		protected function formatRequest():void 
		{
			//The configuration is stronger then the args
			if(_config.partnerId != null && _call.args["partnerId"] == -1)
				_call.setRequestArgument("partnerId", _config.partnerId); 
				
			if (_config.vs != null)
				_call.setRequestArgument("vs", _config.vs);

			if(_config.clientTag != null)
				_call.setRequestArgument("clientTag", _config.clientTag);
			
			_call.setRequestArgument("ignoreNull", _config.ignoreNull);
			
			//Create signature hash.
			//call.setRequestArgument("vidsig", getMD5Checksum(call));
		}
		
		protected function sendRequest():void {
			//construct the loader
			createURLLoader();
			
			//create the service request for normal calls
			var url : String = _config.domain +"/"+_config.srvUrl+"?service="+call.service+"&action="+call.action;
			
			if( _call.method == URLRequestMethod.GET )url += "&";
			
			var req:URLRequest = new URLRequest( url );
			req.contentType = "application/x-www-form-urlencoded";
			req.method = call.method; 
			req.data = call.args; 

			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(req);
		}
		
		protected function createURLLoader():void {
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onDataComplete);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHTTPStatus);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			loader.addEventListener(Event.OPEN, onOpen);
		}
		
		protected function onHTTPStatus(event:HTTPStatusEvent):void { }
		
		protected function onOpen(event:Event):void {
			connectTimer.stop();
			loadTimer.start();
		}
		
		protected function addOptionalArguments():void {
			//add optional args here
		}
		
		// Event Handlers
		protected function onDataComplete(event:Event):void {
			try{	
				handleResult( XML(event.target.data) );
			}
			catch( e:Error )
			{
				var vErr : VidiunError = new VidiunError();
				vErr.errorCode = String(e.errorID);
				vErr.errorMsg = e.message;
				_call.handleError( vErr );
			} 
		}
		
		protected function onError( event:ErrorEvent ):void {
			clean();
			var vError:VidiunError = createVidiunError( event, loader.data);
			
			if(!vError)
			{
				vError.errorMsg = event.text;
				//vError.errorCode;
			}
				
			call.handleError(vError);
			
			dispatchEvent(new VidiunEvent(VidiunEvent.FAILED, false, false, false, null, vError));
		}
		
		protected function handleResult(result:XML):void {
			clean();
			
			var error:VidiunError = validateVidiunResponse(result);
			
			if (error == null) {
				var digestedResult : Object = parse(result);
				call.handleResult( digestedResult );
			} else {
				call.handleError(error);
			}
		}
		
		protected function clean():void {
			connectTimer.stop();
			loadTimer.stop();
			
			if (loader == null) { return; }
			
			loader.removeEventListener(Event.COMPLETE, onDataComplete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			loader.removeEventListener(Event.OPEN, onOpen);
		}
		
		//override this parssing function in the spasific delegate 
		public function parse( result : XML ) : * { return null; }
		
		//Overide this to create validation object and fill it
		protected function validateVidiunResponse(result:String) : VidiunError 
		{ 
			var vError : VidiunError = null;
			var xml : XML = XML(result);
			if(xml.result.hasOwnProperty('error')){
				vError = new VidiunError();
				vError.errorCode = String(xml.result.error.code);
				vError.errorMsg = xml.result.error.message;
				dispatchEvent(new VidiunEvent(VidiunEvent.FAILED, false, false, false, null, vError));	
			}
			
			return vError;
		}
		
		//Overide this to create error object and fill it
		protected function createVidiunError( event : ErrorEvent , loaderData : * ) : VidiunError 
		{ 
			var ke : VidiunError = new VidiunError();
			return ke; 
		}
	}
}