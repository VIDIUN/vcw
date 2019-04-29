package com.vidiun
{
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.net.VidiunCall;
	
	import flash.events.EventDispatcher;

	public class VidiunClient extends EventDispatcher
	{	
		protected var _currentConfig:VidiunConfig;
		
		public function VidiunClient( config : VidiunConfig) 
		{
			_currentConfig = config;
		}
		
		//Setters & Getters
		public function get partnerId():String  { return _currentConfig ? this._currentConfig.partnerId : null; }
		public function get domain():String { return _currentConfig ? this._currentConfig.domain : null; }
		
		public function set vs( currentConfig : String ):void  {  _currentConfig.vs = currentConfig; }
		[Bindable]public function get vs():String  { return _currentConfig ? this._currentConfig.vs : null; }
		
		public function set clientTag(value:String):void { _currentConfig.clientTag = value; }
		public function get clientTag():String { return _currentConfig.clientTag; }
		
		
		public function post(call:VidiunCall):VidiunCall {
			if (_currentConfig) {
				call.config = _currentConfig;
				call.initialize();
				call.execute();
			} else {
				throw new Error("Cannot post a call; no vidiun config has been set.");
			}
			return call;
		}
	}
}