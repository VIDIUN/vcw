package com.vidiun.commands.metadata
{
	import com.vidiun.vo.File;
	import com.vidiun.delegates.metadata.MetadataUpdateFromFileDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataUpdateFromFile extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataUpdateFromFile( id : int,xmlFile : file=null )
		{
			if(xmlFile== null)xmlFile= new file();
			service= 'metadata_metadata';
			action= 'updateFromFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(xmlFile,'xmlFile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataUpdateFromFileDelegate( this , config );
		}
	}
}
