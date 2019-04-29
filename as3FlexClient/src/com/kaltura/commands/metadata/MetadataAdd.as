package com.vidiun.commands.metadata
{
	import com.vidiun.delegates.metadata.MetadataAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataAdd extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataAdd( metadataProfileId : int,objectType : int,objectId : String,xmlData : String )
		{
			service= 'metadata_metadata';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'metadataProfileId' );
			valueArr.push( metadataProfileId );
			keyArr.push( 'objectType' );
			valueArr.push( objectType );
			keyArr.push( 'objectId' );
			valueArr.push( objectId );
			keyArr.push( 'xmlData' );
			valueArr.push( xmlData );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataAddDelegate( this , config );
		}
	}
}
