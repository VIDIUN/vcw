package com.vidiun.commands.media
{
	import com.vidiun.vo.VidiunMediaEntryFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.media.MediaListDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaList extends VidiunCall
	{
		public var filterFields : String;
		public function MediaList( filter : VidiunMediaEntryFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunMediaEntryFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'media';
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
			delegate = new MediaListDelegate( this , config );
		}
	}
}
