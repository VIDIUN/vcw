package com.vidiun.commands.uploadToken
{
	import com.vidiun.vo.VidiunUploadToken;
	import com.vidiun.delegates.uploadToken.UploadTokenAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class UploadTokenAdd extends VidiunCall
	{
		public var filterFields : String;
		public function UploadTokenAdd( uploadToken : VidiunUploadToken=null )
		{
			if(uploadToken== null)uploadToken= new VidiunUploadToken();
			service= 'uploadtoken';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(uploadToken,'uploadToken');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadTokenAddDelegate( this , config );
		}
	}
}
