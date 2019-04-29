package com.vidiun.commands.media
{
	import com.vidiun.vo.VidiunMediaEntry;
	import com.vidiun.delegates.media.MediaAddFromRecordedWebcamDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaAddFromRecordedWebcam extends VidiunCall
	{
		public var filterFields : String;
		public function MediaAddFromRecordedWebcam( mediaEntry : VidiunMediaEntry,webcamTokenId : String )
		{
			service= 'media';
			action= 'addFromRecordedWebcam';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'webcamTokenId' );
			valueArr.push( webcamTokenId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaAddFromRecordedWebcamDelegate( this , config );
		}
	}
}
