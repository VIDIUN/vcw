package com.vidiun.commands.metadataProfile
{
	import com.vidiun.vo.VidiunMetadataProfileFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.metadataProfile.MetadataProfileListDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataProfileList extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataProfileList( filter : VidiunMetadataProfileFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunMetadataProfileFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'metadata_metadataprofile';
			action= 'list';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileListDelegate( this , config );
		}
	}
}
