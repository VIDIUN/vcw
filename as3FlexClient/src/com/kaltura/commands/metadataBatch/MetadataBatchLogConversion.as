package com.vidiun.commands.metadataBatch
{
	import com.vidiun.delegates.metadataBatch.MetadataBatchLogConversionDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchLogConversion extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchLogConversion( flavorAssetId : String,data : String )
		{
			service= 'metadata_metadatabatch';
			action= 'logConversion';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'flavorAssetId' );
			valueArr.push( flavorAssetId );
			keyArr.push( 'data' );
			valueArr.push( data );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchLogConversionDelegate( this , config );
		}
	}
}
