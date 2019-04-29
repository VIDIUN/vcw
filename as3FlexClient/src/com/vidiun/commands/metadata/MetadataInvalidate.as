package com.vidiun.commands.metadata
{
	import com.vidiun.delegates.metadata.MetadataInvalidateDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataInvalidate extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataInvalidate( id : int )
		{
			service= 'metadata_metadata';
			action= 'invalidate';

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
			delegate = new MetadataInvalidateDelegate( this , config );
		}
	}
}
