package com.vidiun.commands.playlist
{
	import com.vidiun.delegates.playlist.PlaylistGetStatsFromContentDelegate;
	import com.vidiun.net.VidiunCall;

	public class PlaylistGetStatsFromContent extends VidiunCall
	{
		public var filterFields : String;
		public function PlaylistGetStatsFromContent( playlistType : int,playlistContent : String )
		{
			service= 'playlist';
			action= 'getStatsFromContent';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'playlistType' );
			valueArr.push( playlistType );
			keyArr.push( 'playlistContent' );
			valueArr.push( playlistContent );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PlaylistGetStatsFromContentDelegate( this , config );
		}
	}
}
