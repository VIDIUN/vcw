package com.vidiun.commands.baseEntry
{
	import com.vidiun.delegates.baseEntry.BaseEntryApproveDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryApprove extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryApprove( entryId : String )
		{
			service= 'baseentry';
			action= 'approve';

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
			delegate = new BaseEntryApproveDelegate( this , config );
		}
	}
}
