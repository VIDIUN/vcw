package com.vidiun.commands.mediaInfo
{
	import com.vidiun.vo.VidiunMediaInfoFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.mediaInfo.MediaInfoListDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaInfoList extends VidiunCall
	{
		public var filterFields : String;
		public function MediaInfoList( filter : VidiunMediaInfoFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunMediaInfoFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'adminconsole_mediainfo';
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
			delegate = new MediaInfoListDelegate( this , config );
		}
	}
}
