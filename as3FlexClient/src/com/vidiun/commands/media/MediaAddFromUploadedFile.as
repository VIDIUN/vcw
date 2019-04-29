package com.vidiun.commands.media
{
	import com.vidiun.vo.VidiunMediaEntry;
	import com.vidiun.delegates.media.MediaAddFromUploadedFileDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaAddFromUploadedFile extends VidiunCall
	{
		public var filterFields : String;
		public function MediaAddFromUploadedFile( mediaEntry : VidiunMediaEntry,uploadTokenId : String )
		{
			service= 'media';
			action= 'addFromUploadedFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'uploadTokenId' );
			valueArr.push( uploadTokenId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaAddFromUploadedFileDelegate( this , config );
		}
	}
}
