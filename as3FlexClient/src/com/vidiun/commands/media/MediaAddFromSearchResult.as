package com.vidiun.commands.media
{
	import com.vidiun.vo.VidiunMediaEntry;
	import com.vidiun.vo.VidiunSearchResult;
	import com.vidiun.delegates.media.MediaAddFromSearchResultDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaAddFromSearchResult extends VidiunCall
	{
		public var filterFields : String;
		public function MediaAddFromSearchResult( mediaEntry : VidiunMediaEntry=null,searchResult : VidiunSearchResult=null )
		{
			if(mediaEntry== null)mediaEntry= new VidiunMediaEntry();
			if(searchResult== null)searchResult= new VidiunSearchResult();
			service= 'media';
			action= 'addFromSearchResult';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(searchResult,'searchResult');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaAddFromSearchResultDelegate( this , config );
		}
	}
}
