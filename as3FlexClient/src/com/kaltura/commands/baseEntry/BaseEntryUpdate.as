package com.vidiun.commands.baseEntry
{
	import com.vidiun.vo.VidiunBaseEntry;
	import com.vidiun.delegates.baseEntry.BaseEntryUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryUpdate( entryId : String,baseEntry : VidiunBaseEntry )
		{
			service= 'baseentry';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = vidiunObject2Arrays(baseEntry,'baseEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryUpdateDelegate( this , config );
		}
	}
}
