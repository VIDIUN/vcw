package com.vidiun.commands.metadata
{
	import com.vidiun.delegates.metadata.MetadataUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataUpdate( id : int,xmlData : String='' )
		{
			service= 'metadata_metadata';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			keyArr.push( 'xmlData' );
			valueArr.push( xmlData );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataUpdateDelegate( this , config );
		}
	}
}
