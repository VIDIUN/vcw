package com.vidiun.commands.media
{
	import com.vidiun.vo.VidiunMediaEntry;
	import com.vidiun.delegates.media.MediaUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function MediaUpdate( entryId : String,mediaEntry : VidiunMediaEntry )
		{
			service= 'media';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = vidiunObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaUpdateDelegate( this , config );
		}
	}
}
