package com.vidiun.commands.entrySchedule
{
	import com.vidiun.vo.VidiunEntrySchedule;
	import com.vidiun.delegates.entrySchedule.EntryScheduleAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class EntryScheduleAdd extends VidiunCall
	{
		public var filterFields : String;
		public function EntryScheduleAdd( entrySchedule : VidiunEntrySchedule )
		{
			service= 'entrySchedule';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(entrySchedule,'entrySchedule');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EntryScheduleAddDelegate( this , config );
		}
	}
}
