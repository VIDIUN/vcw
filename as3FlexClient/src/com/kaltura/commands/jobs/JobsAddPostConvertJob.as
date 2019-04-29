package com.vidiun.commands.jobs
{
	import com.vidiun.vo.VidiunBatchJob;
	import com.vidiun.vo.VidiunPostConvertJobData;
	import com.vidiun.delegates.jobs.JobsAddPostConvertJobDelegate;
	import com.vidiun.net.VidiunCall;

	public class JobsAddPostConvertJob extends VidiunCall
	{
		public var filterFields : String;
		public function JobsAddPostConvertJob( job : VidiunBatchJob,data : VidiunPostConvertJobData )
		{
			service= 'jobs';
			action= 'addPostConvertJob';

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
			delegate = new JobsAddPostConvertJobDelegate( this , config );
		}
	}
}
