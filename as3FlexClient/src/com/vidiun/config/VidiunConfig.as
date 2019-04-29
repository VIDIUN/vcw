package com.vidiun.config 
{	
	import flash.events.EventDispatcher;

	public class VidiunConfig extends EventDispatcher implements IVidiunConfig
	{
		protected var _partnerId:String; 
		protected var _vs:String;
		protected var _clientTag:String;
		protected var _domain : String = "http://www.vidiun.com";
		protected var _srvUrl:String = "/api_v3/index.php"; //will be defined by the genertor
		protected var _ignoreNull : int = 1;
		
		public function VidiunConfig() {
			super();
		}

		public function set domain(value:String):void { _domain= value; }
		public function get domain():String { return _domain; }
		
		public function set srvUrl(value:String):void { _srvUrl= value; }
		public function get srvUrl():String { return _srvUrl; }

		public function get partnerId():String { return _partnerId;	}
		public function set partnerId(value:String):void {  _partnerId = value; }

		public function get vs():String { return _vs; }
		public function set vs(value:String):void { _vs = value; }
		
		public function get clientTag():String { return _clientTag; }
		public function set clientTag(value:String):void { _clientTag = value; }

		public function get ignoreNull():int { return _ignoreNull; }
		public function set ignoreNull(value:int):void { _ignoreNull = value; }
	}
}