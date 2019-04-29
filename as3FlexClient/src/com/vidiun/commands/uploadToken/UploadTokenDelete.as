package com.vidiun.commands.uploadToken
{
	import com.vidiun.delegates.uploadToken.UploadTokenDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class UploadTokenDelete extends VidiunCall
	{
		public var filterFields : String;
		public function UploadTokenDelete( uploadTokenId : String )
		{
			service= 'uploadtoken';
			action= 'delete';

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
			delegate = new UploadTokenDeleteDelegate( this , config );
		}
	}
}
