package com.vidiun.commands.media
{
	import com.vidiun.delegates.media.MediaUpdateThumbnailFromSourceEntryDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaUpdateThumbnailFromSourceEntry extends VidiunCall
	{
		public var filterFields : String;
		public function MediaUpdateThumbnailFromSourceEntry( entryId : String,sourceEntryId : String,timeOffset : int )
		{
			service= 'media';
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
			delegate = new MediaUpdateThumbnailFromSourceEntryDelegate( this , config );
		}
	}
}
