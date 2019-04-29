package com.vidiun.events {
	
	import com.vidiun.errors.VidiunError;
	
	import flash.events.Event;

	public class VidiunEvent extends Event {
		
		public static const COMPLETE:String = 'complete';
		public static const FAILED:String = 'failed';

		public var success:Boolean;
		public var data:Object;
		public var error:VidiunError;
		
		public function VidiunEvent(type:String,
									 bubbles:Boolean=false,
									 cancelable:Boolean=false,
									 success:Boolean = false,
									 data:Object = null, 
									 error:VidiunError = null) 
		{
			this.success = success;
			this.data = data;
			this.error = error;
			
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new VidiunEvent(type, bubbles, cancelable, success, data, error);
		}
		
		override public function toString():String {
			return formatToString('VidiunEvent', 'type', 'success', 'data', 'error');
		}
		
	}
}