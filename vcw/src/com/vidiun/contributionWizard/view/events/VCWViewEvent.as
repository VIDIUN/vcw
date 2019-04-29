package com.vidiun.contributionWizard.view.events
{
	import flash.events.Event;

	public class VCWViewEvent extends Event
	{
		public static const CLOSE_WIZARD:String 		= "closeWizard";

		public function VCWViewEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false):void
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new VCWViewEvent(type, bubbles, cancelable);
		}
	}
}