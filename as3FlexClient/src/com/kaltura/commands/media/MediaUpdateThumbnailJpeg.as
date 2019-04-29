package com.vidiun.commands.media
{
	import com.vidiun.delegates.media.MediaUpdateThumbnailJpegDelegate;
	import com.vidiun.net.VidiunFileCall;

	import flash.utils.ByteArray;

	public class MediaUpdateThumbnailJpeg extends VidiunFileCall
	{
		public function MediaUpdateThumbnailJpeg( entryId : String, fileData : ByteArray )
		{
			service= 'media';
			action= 'updateThumbnailJpeg';
			applySchema(['entryId'] , [entryId]);
			bytes = fileData;
		}

		override public function execute() : void
		{
			delegate = new MediaUpdateThumbnailJpegDelegate( this , config );
		}
	}
}
