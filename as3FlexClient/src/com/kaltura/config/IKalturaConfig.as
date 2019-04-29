package com.vidiun.config {
	
	import flash.events.IEventDispatcher;
	
	public interface IVidiunConfig extends IEventDispatcher 
	{	
		function get partnerId():String; 
		function set partnerId(value:String):void;

		function get srvUrl():String;
		function set srvUrl(value:String):void;
		
		function get domain():String;
		function set domain(value:String):void;
	
		function get vs():String;
		function set vs(value:String):void;

	    function get ignoreNull():int;
	    function set ignoreNull(value:int):void;
	}
}