package com.vidiun.commands.metadataBatch
{
	import com.vidiun.vo.VidiunExclusiveLockKey;
	import com.vidiun.vo.VidiunMetadataBatchJob;
	import com.vidiun.delegates.metadataBatch.MetadataBatchUpdateExclusiveTransformMetadataJobDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchUpdateExclusiveTransformMetadataJob extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchUpdateExclusiveTransformMetadataJob( id : int,lockKey : VidiunExclusiveLockKey,job : VidiunMetadataBatchJob )
		{
			service= 'metadata_metadatabatch';
			action= 'updateExclusiveTransformMetadataJob';

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
			delegate = new MetadataBatchUpdateExclusiveTransformMetadataJobDelegate( this , config );
		}
	}
}