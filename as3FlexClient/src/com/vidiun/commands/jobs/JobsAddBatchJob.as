package com.vidiun.commands.jobs
{
	import com.vidiun.vo.VidiunBatchJob;
	import com.vidiun.delegates.jobs.JobsAddBatchJobDelegate;
	import com.vidiun.net.VidiunCall;

	public class JobsAddBatchJob extends VidiunCall
	{
		public var filterFields : String;
		public function JobsAddBatchJob( batchJob : VidiunBatchJob )
		{
			service= 'jobs';
			action= 'addBatchJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(batchJob,'batchJob');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddBatchJobDelegate( this , config );
		}
	}
}
