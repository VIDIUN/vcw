package com.vidiun.commands.jobs
{
	import com.vidiun.vo.VidiunMailJob;
	import com.vidiun.delegates.jobs.JobsAddMailJobDelegate;
	import com.vidiun.net.VidiunCall;

	public class JobsAddMailJob extends VidiunCall
	{
		public var filterFields : String;
		public function JobsAddMailJob( mailJob : VidiunMailJob )
		{
			service= 'jobs';
			action= 'addMailJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(mailJob,'mailJob');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddMailJobDelegate( this , config );
		}
	}
}
