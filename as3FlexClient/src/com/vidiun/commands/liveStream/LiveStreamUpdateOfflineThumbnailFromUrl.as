package com.vidiun.commands.liveStream
{
	import com.vidiun.delegates.liveStream.LiveStreamUpdateOfflineThumbnailFromUrlDelegate;
	import com.vidiun.net.VidiunCall;

	public class LiveStreamUpdateOfflineThumbnailFromUrl extends VidiunCall
	{
		public var filterFields : String;
		public function LiveStreamUpdateOfflineThumbnailFromUrl( entryId : String,url : String )
		{
			service= 'livestream';
			action= 'updateOfflineThumbnailFromUrl';

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
			delegate = new LiveStreamUpdateOfflineThumbnailFromUrlDelegate( this , config );
		}
	}
}
