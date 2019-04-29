package com.vidiun.commands.metadataProfile
{
	import com.vidiun.delegates.metadataProfile.MetadataProfileDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataProfileDelete extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataProfileDelete( id : int )
		{
			service= 'metadata_metadataprofile';
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
			delegate = new MetadataProfileDeleteDelegate( this , config );
		}
	}
}
