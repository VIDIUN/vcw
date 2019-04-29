package com.vidiun.commands.upload
{
	import com.vidiun.vo.File;
	import com.vidiun.delegates.upload.UploadUploadDelegate;
	import com.vidiun.net.VidiunCall;

	public class UploadUpload extends VidiunCall
	{
		public var filterFields : String;
		public function UploadUpload( fileData : file )
		{
			service= 'upload';
			action= 'upload';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(fileData,'fileData');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadUploadDelegate( this , config );
		}
	}
}
