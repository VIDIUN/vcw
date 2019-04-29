package com.vidiun.commands.flavorAsset
{
	import com.vidiun.delegates.flavorAsset.FlavorAssetGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorAssetGet extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorAssetGet( id : String )
		{
			service= 'flavorasset';
			action= 'get';

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
			delegate = new FlavorAssetGetDelegate( this , config );
		}
	}
}
