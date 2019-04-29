package com.vidiun.commands.baseEntry
{
	import com.vidiun.delegates.baseEntry.BaseEntryDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryDelete extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryDelete( entryId : String )
		{
			service= 'baseentry';
			action= 'delete';

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
			delegate = new BaseEntryDeleteDelegate( this , config );
		}
	}
}
