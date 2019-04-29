package com.vidiun.commands.metadataProfile
{
	import com.vidiun.delegates.metadataProfile.MetadataProfileGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataProfileGet extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataProfileGet( id : int )
		{
			service= 'metadata_metadataprofile';
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
			delegate = new MetadataProfileGetDelegate( this , config );
		}
	}
}
