package com.vidiun.commands.playlist
{
	import com.vidiun.delegates.playlist.PlaylistExecuteFromContentDelegate;
	import com.vidiun.net.VidiunCall;

	public class PlaylistExecuteFromContent extends VidiunCall
	{
		public var filterFields : String;
		public function PlaylistExecuteFromContent( playlistType : int,playlistContent : String,detailed : String='' )
		{
			service= 'playlist';
			action= 'executeFromContent';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'playlistType' );
			valueArr.push( playlistType );
			keyArr.push( 'playlistContent' );
			valueArr.push( playlistContent );
			keyArr.push( 'detailed' );
			valueArr.push( detailed );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PlaylistExecuteFromContentDelegate( this , config );
		}
	}
}
