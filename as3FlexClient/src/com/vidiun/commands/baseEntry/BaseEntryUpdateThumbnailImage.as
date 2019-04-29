package com.vidiun.commands.baseEntry
{
	import com.vidiun.delegates.baseEntry.BaseEntryUpdateThumbnailImageDelegate;
	import com.vidiun.net.VidiunFileCall;
	
	import flash.net.FileReference;

	public class BaseEntryUpdateThumbnailImage extends VidiunFileCall
	{
		
		
		public var fileData:FileReference;
		
		public function BaseEntryUpdateThumbnailImage( entryId : String, fileData : FileReference )
		{
			service= 'baseEntry';
			action= 'updateThumbnailJpeg';
			applySchema(['entryId'] , [entryId]);
			this.fileData = fileData;
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryUpdateThumbnailImageDelegate( this , config );
		}
	}
}
