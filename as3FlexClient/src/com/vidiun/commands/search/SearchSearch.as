package com.vidiun.commands.search
{
	import com.vidiun.vo.VidiunSearch;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.search.SearchSearchDelegate;
	import com.vidiun.net.VidiunCall;

	public class SearchSearch extends VidiunCall
	{
		public var filterFields : String;
		public function SearchSearch( search : VidiunSearch,pager : VidiunFilterPager=null )
		{
			if(pager== null)pager= new VidiunFilterPager();
			service= 'search';
			action= 'search';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(search,'search');
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
			delegate = new SearchSearchDelegate( this , config );
		}
	}
}
