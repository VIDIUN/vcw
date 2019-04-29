package com.vidiun.commands.metadataProfile
{
	import com.vidiun.vo.VidiunMetadataProfile;
	import com.vidiun.delegates.metadataProfile.MetadataProfileUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataProfileUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataProfileUpdate( id : int,metadataProfile : VidiunMetadataProfile,xsdData : String='',viewsData : String='' )
		{
			service= 'metadata_metadataprofile';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(metadataProfile,'metadataProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'xsdData' );
			valueArr.push( xsdData );
			keyArr.push( 'viewsData' );
			valueArr.push( viewsData );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileUpdateDelegate( this , config );
		}
	}
}
