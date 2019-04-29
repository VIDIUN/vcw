package com.vidiun.commands.upload
{
	import com.vidiun.delegates.upload.UploadGetUploadedFileStatusByTokenIdDelegate;
	import com.vidiun.net.VidiunCall;

	public class UploadGetUploadedFileStatusByTokenId extends VidiunCall
	{
		public var filterFields : String;
		public function UploadGetUploadedFileStatusByTokenId( uploadTokenId : String )
		{
			service= 'upload';
			action= 'getUploadedFileStatusByTokenId';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'uploadTokenId' );
			valueArr.push( uploadTokenId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadGetUploadedFileStatusByTokenIdDelegate( this , config );
		}
	}
}
