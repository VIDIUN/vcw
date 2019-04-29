package com.vidiun.commands.jobs
{
	import com.vidiun.vo.VidiunBatchJob;
	import com.vidiun.vo.VidiunExtractMediaJobData;
	import com.vidiun.delegates.jobs.JobsAddExtractMediaJobDelegate;
	import com.vidiun.net.VidiunCall;

	public class JobsAddExtractMediaJob extends VidiunCall
	{
		public var filterFields : String;
		public function JobsAddExtractMediaJob( job : VidiunBatchJob,extractMediaType : int,data : VidiunExtractMediaJobData )
		{
			service= 'jobs';
			action= 'addExtractMediaJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'extractMediaType' );
			valueArr.push( extractMediaType );
 			keyValArr = vidiunObject2Arrays(data,'data');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddExtractMediaJobDelegate( this , config );
		}
	}
}
