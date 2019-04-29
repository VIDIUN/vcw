package com.vidiun.commands.jobs
{
	import com.vidiun.delegates.jobs.JobsGetBulkUploadStatusDelegate;
	import com.vidiun.net.VidiunCall;

	public class JobsGetBulkUploadStatus extends VidiunCall
	{
		public var filterFields : String;
		public function JobsGetBulkUploadStatus( job_id : int )
		{
			service= 'jobs';
			action= 'getBulkUploadStatus';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'job_id' );
			valueArr.push( job_id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsGetBulkUploadStatusDelegate( this , config );
		}
	}
}
