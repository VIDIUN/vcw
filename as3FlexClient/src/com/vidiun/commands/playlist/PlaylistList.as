package com.vidiun.commands.playlist
{
	import com.vidiun.vo.VidiunPlaylistFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.playlist.PlaylistListDelegate;
	import com.vidiun.net.VidiunCall;

	public class PlaylistList extends VidiunCall
	{
		public var filterFields : String;
		public function PlaylistList( filter : VidiunPlaylistFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunPlaylistFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'playlist';
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
			delegate = new PlaylistListDelegate( this , config );
		}
	}
}
