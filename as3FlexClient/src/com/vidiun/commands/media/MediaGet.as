package com.vidiun.commands.media
{
	import com.vidiun.delegates.media.MediaGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaGet extends VidiunCall
	{
		public var filterFields : String;
		public function MediaGet( entryId : String,version : int=-1 )
		{
			service= 'media';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaGetDelegate( this , config );
		}
	}
}
