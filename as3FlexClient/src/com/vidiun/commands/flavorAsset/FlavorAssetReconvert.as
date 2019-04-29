package com.vidiun.commands.flavorAsset
{
	import com.vidiun.delegates.flavorAsset.FlavorAssetReconvertDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorAssetReconvert extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorAssetReconvert( id : String )
		{
			service= 'flavorasset';
			action= 'reconvert';

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
			delegate = new FlavorAssetReconvertDelegate( this , config );
		}
	}
}
