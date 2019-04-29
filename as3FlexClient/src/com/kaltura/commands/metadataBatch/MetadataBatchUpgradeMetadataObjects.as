package com.vidiun.commands.metadataBatch
{
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.metadataBatch.MetadataBatchUpgradeMetadataObjectsDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchUpgradeMetadataObjects extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchUpgradeMetadataObjects( metadataProfileId : int,srcVersion : int,destVersion : int,pager : VidiunFilterPager=null )
		{
			if(pager== null)pager= new VidiunFilterPager();
			service= 'metadata_metadatabatch';
			action= 'upgradeMetadataObjects';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'metadataProfileId' );
			valueArr.push( metadataProfileId );
			keyArr.push( 'srcVersion' );
			valueArr.push( srcVersion );
			keyArr.push( 'destVersion' );
			valueArr.push( destVersion );
 			keyValArr = vidiunObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchUpgradeMetadataObjectsDelegate( this , config );
		}
	}
}
