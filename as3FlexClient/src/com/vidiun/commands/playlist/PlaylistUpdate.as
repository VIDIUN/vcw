package com.vidiun.commands.playlist
{
	import com.vidiun.vo.VidiunPlaylist;
	import com.vidiun.delegates.playlist.PlaylistUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class PlaylistUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function PlaylistUpdate( id : String,playlist : VidiunPlaylist,updateStats : Boolean=false )
		{
			service= 'playlist';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(playlist,'playlist');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'updateStats' );
			valueArr.push( updateStats );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PlaylistUpdateDelegate( this , config );
		}
	}
}
