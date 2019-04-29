package com.vidiun.commands.search
{
	import com.vidiun.vo.VidiunSearchResult;
	import com.vidiun.delegates.search.SearchGetMediaInfoDelegate;
	import com.vidiun.net.VidiunCall;

	public class SearchGetMediaInfo extends VidiunCall
	{
		public var filterFields : String;
		public function SearchGetMediaInfo( searchResult : VidiunSearchResult )
		{
			service= 'search';
			action= 'getMediaInfo';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(searchResult,'searchResult');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SearchGetMediaInfoDelegate( this , config );
		}
	}
}
