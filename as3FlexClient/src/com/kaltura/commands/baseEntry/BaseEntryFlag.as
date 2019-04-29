package com.vidiun.commands.baseEntry
{
	import com.vidiun.vo.VidiunModerationFlag;
	import com.vidiun.delegates.baseEntry.BaseEntryFlagDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryFlag extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryFlag( moderationFlag : VidiunModerationFlag )
		{
			service= 'baseentry';
			action= 'flag';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(moderationFlag,'moderationFlag');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryFlagDelegate( this , config );
		}
	}
}
