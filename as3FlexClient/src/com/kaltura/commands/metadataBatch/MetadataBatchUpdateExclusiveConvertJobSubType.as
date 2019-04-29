package com.vidiun.commands.metadataBatch
{
	import com.vidiun.vo.VidiunExclusiveLockKey;
	import com.vidiun.delegates.metadataBatch.MetadataBatchUpdateExclusiveConvertJobSubTypeDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchUpdateExclusiveConvertJobSubType extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchUpdateExclusiveConvertJobSubType( id : int,lockKey : VidiunExclusiveLockKey,subType : int )
		{
			service= 'metadata_metadatabatch';
			action= 'updateExclusiveConvertJobSubType';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'subType' );
			valueArr.push( subType );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchUpdateExclusiveConvertJobSubTypeDelegate( this , config );
		}
	}
}
