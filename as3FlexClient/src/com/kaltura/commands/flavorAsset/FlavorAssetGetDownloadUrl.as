package com.vidiun.commands.flavorAsset
{
	import com.vidiun.delegates.flavorAsset.FlavorAssetGetDownloadUrlDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorAssetGetDownloadUrl extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorAssetGetDownloadUrl( id : String )
		{
			service= 'flavorasset';
			action= 'getDownloadUrl';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FlavorAssetGetDownloadUrlDelegate( this , config );
		}
	}
}
