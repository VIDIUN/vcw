package com.vidiun.commands.metadataBatch
{
	import com.vidiun.vo.VidiunBulkUploadResult;
	import com.vidiun.delegates.metadataBatch.MetadataBatchAddBulkUploadResultDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchAddBulkUploadResult extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchAddBulkUploadResult( bulkUploadResult : VidiunBulkUploadResult,pluginDataArray : Array=null )
		{
			if(pluginDataArray== null)pluginDataArray= new Array();
			service= 'metadata_metadatabatch';
			action= 'addBulkUploadResult';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(bulkUploadResult,'bulkUploadResult');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = extractArray(pluginDataArray,'pluginDataArray');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchAddBulkUploadResultDelegate( this , config );
		}
	}
}
