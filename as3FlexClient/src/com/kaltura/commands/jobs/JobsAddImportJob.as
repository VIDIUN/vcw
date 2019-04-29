package com.vidiun.commands.jobs
{
	import com.vidiun.vo.VidiunBatchJob;
	import com.vidiun.vo.VidiunImportJobData;
	import com.vidiun.delegates.jobs.JobsAddImportJobDelegate;
	import com.vidiun.net.VidiunCall;

	public class JobsAddImportJob extends VidiunCall
	{
		public var filterFields : String;
		public function JobsAddImportJob( job : VidiunBatchJob,data : VidiunImportJobData )
		{
			service= 'jobs';
			action= 'addImportJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(data,'data');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddImportJobDelegate( this , config );
		}
	}
}
