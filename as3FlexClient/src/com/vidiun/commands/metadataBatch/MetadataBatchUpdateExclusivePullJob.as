package com.vidiun.commands.metadataBatch
{
	import com.vidiun.vo.VidiunExclusiveLockKey;
	import com.vidiun.vo.VidiunBatchJob;
	import com.vidiun.delegates.metadataBatch.MetadataBatchUpdateExclusivePullJobDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchUpdateExclusivePullJob extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchUpdateExclusivePullJob( id : int,lockKey : VidiunExclusiveLockKey,job : VidiunBatchJob )
		{
			service= 'metadata_metadatabatch';
			action= 'updateExclusivePullJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchUpdateExclusivePullJobDelegate( this , config );
		}
	}
}
