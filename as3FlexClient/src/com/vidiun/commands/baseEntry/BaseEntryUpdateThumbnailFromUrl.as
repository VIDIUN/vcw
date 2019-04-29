package com.vidiun.commands.baseEntry
{
	import com.vidiun.delegates.baseEntry.BaseEntryUpdateThumbnailFromUrlDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryUpdateThumbnailFromUrl extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryUpdateThumbnailFromUrl( entryId : String,url : String )
		{
			service= 'baseentry';
			action= 'updateThumbnailFromUrl';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'url' );
			valueArr.push( url );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryUpdateThumbnailFromUrlDelegate( this , config );
		}
	}
}
