package com.vidiun.commands.metadataProfile
{
	import com.vidiun.vo.File;
	import com.vidiun.delegates.metadataProfile.MetadataProfileUpdateDefinitionFromFileDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataProfileUpdateDefinitionFromFile extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataProfileUpdateDefinitionFromFile( id : int,xsdFile : file )
		{
			service= 'metadata_metadataprofile';
			action= 'updateDefinitionFromFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(xsdFile,'xsdFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileUpdateDefinitionFromFileDelegate( this , config );
		}
	}
}
