package com.vidiun.commands.jobs
{
	import com.vidiun.vo.VidiunBatchJob;
	import com.vidiun.vo.VidiunBulkUploadJobData;
	import com.vidiun.vo.File;
	import com.vidiun.delegates.jobs.JobsAddBulkUploadJobDelegate;
	import com.vidiun.net.VidiunCall;

	public class JobsAddBulkUploadJob extends VidiunCall
	{
		public var filterFields : String;
		public function JobsAddBulkUploadJob( job : VidiunBatchJob,data : VidiunBulkUploadJobData,csvFileData : file )
		{
			service= 'jobs';
			action= 'addBulkUploadJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(data,'data');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(csvFileData,'csvFileData');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddBulkUploadJobDelegate( this , config );
		}
	}
}
