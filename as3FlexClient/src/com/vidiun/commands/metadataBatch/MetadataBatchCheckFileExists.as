package com.vidiun.commands.metadataBatch
{
	import com.vidiun.delegates.metadataBatch.MetadataBatchCheckFileExistsDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchCheckFileExists extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchCheckFileExists( localPath : String,size : int )
		{
			service= 'metadata_metadatabatch';
			action= 'checkFileExists';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'localPath' );
			valueArr.push( localPath );
			keyArr.push( 'size' );
			valueArr.push( size );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchCheckFileExistsDelegate( this , config );
		}
	}
}
