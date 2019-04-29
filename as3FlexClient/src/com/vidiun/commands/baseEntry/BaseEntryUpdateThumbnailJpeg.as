package com.vidiun.commands.baseEntry
{
	import com.vidiun.delegates.baseEntry.BaseEntryUpdateThumbnailJpegDelegate;
	import com.vidiun.net.VidiunFileCall;
	import flash.utils.ByteArray;

	public class BaseEntryUpdateThumbnailJpeg extends VidiunFileCall
	{
		public function BaseEntryUpdateThumbnailJpeg( entryId : String, fileData : ByteArray )
		{
			service= 'baseEntry';
			action= 'updateThumbnailJpeg';
			applySchema(['entryId'] , [entryId]);
			bytes = fileData;
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryUpdateThumbnailJpegDelegate( this , config );
		}
	}
}
