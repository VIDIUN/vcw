package com.vidiun.commands.media
{
	import com.vidiun.delegates.media.MediaDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaDelete extends VidiunCall
	{
		public var filterFields : String;
		public function MediaDelete( entryId : String )
		{
			service= 'media';
			action= 'delete';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaDeleteDelegate( this , config );
		}
	}
}
