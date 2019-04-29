package com.vidiun.commands.metadataProfile
{
	import com.vidiun.vo.File;
	import com.vidiun.delegates.metadataProfile.MetadataProfileUpdateViewsFromFileDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataProfileUpdateViewsFromFile extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataProfileUpdateViewsFromFile( id : int,viewsFile : file )
		{
			service= 'metadata_metadataprofile';
			action= 'updateViewsFromFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(viewsFile,'viewsFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileUpdateViewsFromFileDelegate( this , config );
		}
	}
}
