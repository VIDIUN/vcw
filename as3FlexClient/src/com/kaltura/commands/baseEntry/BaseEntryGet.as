package com.vidiun.commands.baseEntry
{
	import com.vidiun.delegates.baseEntry.BaseEntryGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryGet extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryGet( entryId : String,version : int=-1 )
		{
			service= 'baseentry';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryGetDelegate( this , config );
		}
	}
}
