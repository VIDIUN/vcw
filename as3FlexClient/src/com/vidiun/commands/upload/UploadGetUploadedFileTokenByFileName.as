package com.vidiun.commands.upload
{
	import com.vidiun.delegates.upload.UploadGetUploadedFileTokenByFileNameDelegate;
	import com.vidiun.net.VidiunCall;

	public class UploadGetUploadedFileTokenByFileName extends VidiunCall
	{
		public var filterFields : String;
		public function UploadGetUploadedFileTokenByFileName( fileName : String )
		{
			service= 'upload';
			action= 'getUploadedFileTokenByFileName';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'fileName' );
			valueArr.push( fileName );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadGetUploadedFileTokenByFileNameDelegate( this , config );
		}
	}
}
