package com.vidiun.commands.liveStream
{
	import com.vidiun.vo.VidiunLiveStreamEntryFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.liveStream.LiveStreamListDelegate;
	import com.vidiun.net.VidiunCall;

	public class LiveStreamList extends VidiunCall
	{
		public var filterFields : String;
		public function LiveStreamList( filter : VidiunLiveStreamEntryFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunLiveStreamEntryFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'livestream';
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
			delegate = new LiveStreamListDelegate( this , config );
		}
	}
}
