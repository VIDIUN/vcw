package com.vidiun.commands.jobs
{
	import com.vidiun.delegates.jobs.JobsGetPostConvertStatusDelegate;
	import com.vidiun.net.VidiunCall;

	public class JobsGetPostConvertStatus extends VidiunCall
	{
		public var filterFields : String;
		public function JobsGetPostConvertStatus( job_id : int )
		{
			service= 'jobs';
			action= 'getPostConvertStatus';

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
			delegate = new JobsGetPostConvertStatusDelegate( this , config );
		}
	}
}
