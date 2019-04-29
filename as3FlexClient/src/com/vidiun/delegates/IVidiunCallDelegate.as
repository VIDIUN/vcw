package com.vidiun.delegates {
	
	import com.vidiun.config.IVidiunConfig;
	import com.vidiun.net.VidiunCall;
	
	import flash.events.IEventDispatcher;
	
	public interface IVidiunCallDelegate extends IEventDispatcher {
		
		function close():void;
		
		function get call():VidiunCall;
		function set call(newVal:VidiunCall):void;
		
		function get config():IVidiunConfig;
		function set config(newVal:IVidiunConfig):void;
	}
	
}