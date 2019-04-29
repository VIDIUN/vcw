package com.vidiun.commands.jobs
{
	import com.vidiun.vo.VidiunBatchJob;
	import com.vidiun.vo.VidiunConvertProfileJobData;
	import com.vidiun.delegates.jobs.JobsAddConvertJobDelegate;
	import com.vidiun.net.VidiunCall;

	public class JobsAddConvertJob extends VidiunCall
	{
		public var filterFields : String;
		public function JobsAddConvertJob( job : VidiunBatchJob,data : VidiunConvertProfileJobData )
		{
			service= 'jobs';
			action= 'addConvertJob';

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
			delegate = new JobsAddConvertJobDelegate( this , config );
		}
	}
}
