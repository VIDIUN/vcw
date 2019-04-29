package com.vidiun.commands.metadataBatch
{
	import com.vidiun.vo.VidiunExclusiveLockKey;
	import com.vidiun.vo.VidiunBatchJob;
	import com.vidiun.delegates.metadataBatch.MetadataBatchUpdateExclusiveStorageExportJobDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchUpdateExclusiveStorageExportJob extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchUpdateExclusiveStorageExportJob( id : int,lockKey : VidiunExclusiveLockKey,job : VidiunBatchJob,entryStatus : int=undefined )
		{
			service= 'metadata_metadatabatch';
			action= 'updateExclusiveStorageExportJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'entryStatus' );
			valueArr.push( entryStatus );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchUpdateExclusiveStorageExportJobDelegate( this , config );
		}
	}
}
