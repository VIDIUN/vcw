package com.vidiun.commands.baseEntry
{
	import com.vidiun.delegates.baseEntry.BaseEntryRejectDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryReject extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryReject( entryId : String )
		{
			service= 'baseentry';
			action= 'reject';

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
			delegate = new BaseEntryRejectDelegate( this , config );
		}
	}
}
