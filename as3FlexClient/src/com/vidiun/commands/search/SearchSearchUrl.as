package com.vidiun.commands.search
{
	import com.vidiun.delegates.search.SearchSearchUrlDelegate;
	import com.vidiun.net.VidiunCall;

	public class SearchSearchUrl extends VidiunCall
	{
		public var filterFields : String;
		public function SearchSearchUrl( mediaType : int,url : String )
		{
			service= 'search';
			action= 'searchUrl';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'mediaType' );
			valueArr.push( mediaType );
			keyArr.push( 'url' );
			valueArr.push( url );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SearchSearchUrlDelegate( this , config );
		}
	}
}
