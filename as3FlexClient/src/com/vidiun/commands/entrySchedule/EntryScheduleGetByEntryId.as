package com.vidiun.commands.entrySchedule
{
	import com.vidiun.delegates.entrySchedule.EntryScheduleGetByEntryIdDelegate;
	import com.vidiun.net.VidiunCall;

	public class EntryScheduleGetByEntryId extends VidiunCall
	{
		public var filterFields : String;
		public function EntryScheduleGetByEntryId( entryId : String )
		{
			service= 'entrySchedule';
			action= 'getByEntryId';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EntryScheduleGetByEntryIdDelegate( this , config );
		}
	}
}
