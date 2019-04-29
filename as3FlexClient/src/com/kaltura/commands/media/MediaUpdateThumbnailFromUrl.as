package com.vidiun.commands.media
{
	import com.vidiun.delegates.media.MediaUpdateThumbnailFromUrlDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaUpdateThumbnailFromUrl extends VidiunCall
	{
		public var filterFields : String;
		public function MediaUpdateThumbnailFromUrl( entryId : String,url : String )
		{
			service= 'media';
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
			delegate = new MediaUpdateThumbnailFromUrlDelegate( this , config );
		}
	}
}
