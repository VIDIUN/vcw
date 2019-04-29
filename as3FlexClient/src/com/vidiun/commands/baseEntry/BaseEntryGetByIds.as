package com.vidiun.commands.baseEntry
{
	import com.vidiun.delegates.baseEntry.BaseEntryGetByIdsDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryGetByIds extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryGetByIds( entryIds : String )
		{
			service= 'baseentry';
			action= 'getByIds';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryIds' );
			valueArr.push( entryIds );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryGetByIdsDelegate( this , config );
		}
	}
}
