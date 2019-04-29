package com.vidiun.commands.jobs
{
	import com.vidiun.vo.VidiunNotification;
	import com.vidiun.delegates.jobs.JobsCreateNotificationDelegate;
	import com.vidiun.net.VidiunCall;

	public class JobsCreateNotification extends VidiunCall
	{
		public var filterFields : String;
		public function JobsCreateNotification( notificationJob : VidiunNotification )
		{
			service= 'jobs';
			action= 'createNotification';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(notificationJob,'notificationJob');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsCreateNotificationDelegate( this , config );
		}
	}
}
