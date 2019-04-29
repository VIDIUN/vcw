package com.vidiun.commands.metadataProfile
{
	import com.vidiun.vo.VidiunMetadataProfile;
	import com.vidiun.vo.File;
	import com.vidiun.vo.File;
	import com.vidiun.delegates.metadataProfile.MetadataProfileAddFromFileDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataProfileAddFromFile extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataProfileAddFromFile( metadataProfile : VidiunMetadataProfile,xsdFile : file,viewsFile : file=null )
		{
			if(viewsFile== null)viewsFile= new file();
			service= 'metadata_metadataprofile';
			action= 'addFromFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(metadataProfile,'metadataProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(xsdFile,'xsdFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(viewsFile,'viewsFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileAddFromFileDelegate( this , config );
		}
	}
}
