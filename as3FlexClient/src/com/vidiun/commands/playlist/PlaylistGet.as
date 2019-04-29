package com.vidiun.commands.playlist
{
	import com.vidiun.delegates.playlist.PlaylistGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class PlaylistGet extends VidiunCall
	{
		public var filterFields : String;
		public function PlaylistGet( id : String,version : int=-1 )
		{
			service= 'playlist';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PlaylistGetDelegate( this , config );
		}
	}
}
