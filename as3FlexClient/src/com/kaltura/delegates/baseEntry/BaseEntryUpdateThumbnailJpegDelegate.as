package com.vidiun.delegates.baseEntry
{
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.core.VClassFactory;
	import com.vidiun.delegates.WebDelegateBase;
	import com.vidiun.errors.VidiunError;
	import com.vidiun.net.VidiunCall;
	import com.vidiun.net.VidiunFileCall;
	
	import flash.events.Event;
	import flash.net.URLLoaderDataFormat;
	import flash.utils.getDefinitionByName;
	
	import mx.utils.UIDUtil;
	
	import ru.inspirit.net.MultipartURLLoader;
	
	public class BaseEntryUpdateThumbnailJpegDelegate extends WebDelegateBase
	{
		protected var mrloader:MultipartURLLoader;
		
		public function BaseEntryUpdateThumbnailJpegDelegate(call:VidiunCall, config:VidiunConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			var cls : Class = getDefinitionByName('com.vidiun.vo.'+ result.result.objectType) as Class;
			var obj : * = (new VClassFactory( cls )).newInstanceFromXML( result.result );
			return obj;
		}
		
		override protected function sendRequest():void {
			//construct the loader
			createURLLoader();

			//create the service request for normal calls
			var variables:String = decodeURIComponent(call.args.toString());
			var req:String = _config.domain +"/"+_config.srvUrl+"?service="+call.service+"&action="+call.action +'&'+variables;
			mrloader.addFile((call as VidiunFileCall).bytes, UIDUtil.createUID(), 'fileData');

			mrloader.dataFormat = URLLoaderDataFormat.TEXT;
			mrloader.load(req);
		}

		// Event Handlers
		override protected function onDataComplete(event:Event):void {
			try{
				handleResult( XML(event.target.loader.data) );
			}
			catch( e:Error )
			{
				var vErr : VidiunError = new VidiunError();
				vErr.errorCode = String(e.errorID);
				vErr.errorMsg = e.message;
				_call.handleError( vErr );
			}
		}

		override protected function createURLLoader():void {
			mrloader = new MultipartURLLoader();
			mrloader.addEventListener(Event.COMPLETE, onDataComplete);
		}

	}
}
