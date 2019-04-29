package com.vidiun.commands.flavorAsset
{
	import com.vidiun.delegates.flavorAsset.FlavorAssetGetWebPlayableByEntryIdDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorAssetGetWebPlayableByEntryId extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorAssetGetWebPlayableByEntryId( entryId : String )
		{
			service= 'flavorasset';
			action= 'getWebPlayableByEntryId';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FlavorAssetGetWebPlayableByEntryIdDelegate( this , config );
		}
	}
}
