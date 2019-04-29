package com.vidiun.commands.metadataBatch
{
	import com.vidiun.delegates.metadataBatch.MetadataBatchGetBulkUploadLastResultDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchGetBulkUploadLastResult extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchGetBulkUploadLastResult( bulkUploadJobId : int )
		{
			service= 'metadata_metadatabatch';
			action= 'getBulkUploadLastResult';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'bulkUploadJobId' );
			valueArr.push( bulkUploadJobId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchGetBulkUploadLastResultDelegate( this , config );
		}
	}
}
