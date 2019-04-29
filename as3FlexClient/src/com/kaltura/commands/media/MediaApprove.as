package com.vidiun.commands.media
{
	import com.vidiun.delegates.media.MediaApproveDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaApprove extends VidiunCall
	{
		public var filterFields : String;
		public function MediaApprove( entryId : String )
		{
			service= 'media';
			action= 'approve';

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
			delegate = new MediaApproveDelegate( this , config );
		}
	}
}
