package com.vidiun.commands.metadataBatch
{
	import com.vidiun.vo.VidiunExclusiveLockKey;
	import com.vidiun.delegates.metadataBatch.MetadataBatchResetJobExecutionAttemptsDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchResetJobExecutionAttempts extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchResetJobExecutionAttempts( id : int,lockKey : VidiunExclusiveLockKey,jobType : int )
		{
			service= 'metadata_metadatabatch';
			action= 'resetJobExecutionAttempts';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'jobType' );
			valueArr.push( jobType );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchResetJobExecutionAttemptsDelegate( this , config );
		}
	}
}
