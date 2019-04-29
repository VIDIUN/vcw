package com.vidiun.commands.flavorAsset
{
	import com.vidiun.delegates.flavorAsset.FlavorAssetDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorAssetDelete extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorAssetDelete( id : String )
		{
			service= 'flavorasset';
			action= 'delete';

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
			delegate = new FlavorAssetDeleteDelegate( this , config );
		}
	}
}
