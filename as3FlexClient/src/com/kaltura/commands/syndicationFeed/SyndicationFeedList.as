package com.vidiun.commands.syndicationFeed
{
	import com.vidiun.vo.VidiunBaseSyndicationFeedFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.syndicationFeed.SyndicationFeedListDelegate;
	import com.vidiun.net.VidiunCall;

	public class SyndicationFeedList extends VidiunCall
	{
		public var filterFields : String;
		public function SyndicationFeedList( filter : VidiunBaseSyndicationFeedFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunBaseSyndicationFeedFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'syndicationfeed';
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
			delegate = new SyndicationFeedListDelegate( this , config );
		}
	}
}
