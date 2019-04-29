package com.vidiun.commands.metadataBatch
{
	import com.vidiun.delegates.metadataBatch.MetadataBatchCleanExclusiveJobsDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchCleanExclusiveJobs extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchCleanExclusiveJobs(  )
		{
			service= 'metadata_metadatabatch';
			action= 'cleanExclusiveJobs';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchCleanExclusiveJobsDelegate( this , config );
		}
	}
}
