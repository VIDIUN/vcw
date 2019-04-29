package com.vidiun.commands.flavorAsset
{
	import com.vidiun.delegates.flavorAsset.FlavorAssetGetFlavorAssetsWithParamsDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorAssetGetFlavorAssetsWithParams extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorAssetGetFlavorAssetsWithParams( entryId : String )
		{
			service= 'flavorasset';
			action= 'getFlavorAssetsWithParams';

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
			delegate = new FlavorAssetGetFlavorAssetsWithParamsDelegate( this , config );
		}
	}
}
