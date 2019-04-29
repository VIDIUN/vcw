package com.vidiun.commands.metadata
{
	import com.vidiun.vo.VidiunMetadataFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.metadata.MetadataListDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataList extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataList( filter : VidiunMetadataFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunMetadataFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'metadata_metadata';
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
			delegate = new MetadataListDelegate( this , config );
		}
	}
}
