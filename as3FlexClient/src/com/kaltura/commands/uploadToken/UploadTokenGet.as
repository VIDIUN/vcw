package com.vidiun.commands.uploadToken
{
	import com.vidiun.delegates.uploadToken.UploadTokenGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class UploadTokenGet extends VidiunCall
	{
		public var filterFields : String;
		public function UploadTokenGet( uploadTokenId : String )
		{
			service= 'uploadtoken';
			action= 'get';

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
			delegate = new UploadTokenGetDelegate( this , config );
		}
	}
}
