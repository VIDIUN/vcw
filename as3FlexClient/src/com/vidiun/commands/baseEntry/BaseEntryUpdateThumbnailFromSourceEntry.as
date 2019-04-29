package com.vidiun.commands.baseEntry
{
	import com.vidiun.delegates.baseEntry.BaseEntryUpdateThumbnailFromSourceEntryDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryUpdateThumbnailFromSourceEntry extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryUpdateThumbnailFromSourceEntry( entryId : String,sourceEntryId : String,timeOffset : int )
		{
			service= 'baseentry';
			action= 'updateThumbnailFromSourceEntry';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'sourceEntryId' );
			valueArr.push( sourceEntryId );
			keyArr.push( 'timeOffset' );
			valueArr.push( timeOffset );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryUpdateThumbnailFromSourceEntryDelegate( this , config );
		}
	}
}
