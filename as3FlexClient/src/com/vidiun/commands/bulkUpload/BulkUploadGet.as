package com.vidiun.commands.bulkUpload
{
	import com.vidiun.delegates.bulkUpload.BulkUploadGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class BulkUploadGet extends VidiunCall
	{
		public var filterFields : String;
		public function BulkUploadGet( id : int )
		{
			service= 'bulkupload';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BulkUploadGetDelegate( this , config );
		}
	}
}
