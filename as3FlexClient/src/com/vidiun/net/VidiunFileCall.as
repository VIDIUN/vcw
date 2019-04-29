package com.vidiun.net {

	import com.vidiun.config.VidiunConfig;
	import com.vidiun.errors.VidiunError;
	import com.vidiun.events.VidiunEvent;

	import flash.net.URLVariables;
	import flash.utils.ByteArray;

	public class VidiunFileCall extends VidiunCall {

		public var bytes : ByteArray;
		public var filterFields : String;
		
		public function VidiunFileCall () {
			super ();
		}
	}
}