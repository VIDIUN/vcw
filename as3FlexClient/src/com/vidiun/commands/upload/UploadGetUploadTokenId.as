package com.vidiun.commands.upload
{
	import com.vidiun.delegates.upload.UploadGetUploadTokenIdDelegate;
	import com.vidiun.net.VidiunCall;

	public class UploadGetUploadTokenId extends VidiunCall
	{
		public var filterFields : String;
		public function UploadGetUploadTokenId(  )
		{
			service= 'upload';
			action= 'getUploadTokenId';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadGetUploadTokenIdDelegate( this , config );
		}
	}
}
