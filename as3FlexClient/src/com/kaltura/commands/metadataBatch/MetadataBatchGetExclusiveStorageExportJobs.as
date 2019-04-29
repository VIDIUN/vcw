package com.vidiun.commands.metadataBatch
{
	import com.vidiun.vo.VidiunExclusiveLockKey;
	import com.vidiun.vo.VidiunBatchJobFilter;
	import com.vidiun.delegates.metadataBatch.MetadataBatchGetExclusiveStorageExportJobsDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchGetExclusiveStorageExportJobs extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchGetExclusiveStorageExportJobs( lockKey : VidiunExclusiveLockKey,maxExecutionTime : int,numberOfJobs : int,filter : VidiunBatchJobFilter=null )
		{
			if(filter== null)filter= new VidiunBatchJobFilter();
			service= 'metadata_metadatabatch';
			action= 'getExclusiveStorageExportJobs';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'maxExecutionTime' );
			valueArr.push( maxExecutionTime );
			keyArr.push( 'numberOfJobs' );
			valueArr.push( numberOfJobs );
 			keyValArr = vidiunObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchGetExclusiveStorageExportJobsDelegate( this , config );
		}
	}
}
