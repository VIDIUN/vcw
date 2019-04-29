package com.vidiun.commands.media
{
	import com.vidiun.vo.VidiunMediaEntry;
	import com.vidiun.delegates.media.MediaAddFromUrlDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaAddFromUrl extends VidiunCall
	{
		public var filterFields : String;
		public function MediaAddFromUrl( mediaEntry : VidiunMediaEntry,url : String )
		{
			service= 'media';
			action= 'addFromUrl';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'url' );
			valueArr.push( url );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaAddFromUrlDelegate( this , config );
		}
	}
}
