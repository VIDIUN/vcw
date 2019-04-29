package com.vidiun.commands.playlist
{
	import com.vidiun.delegates.playlist.PlaylistDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class PlaylistDelete extends VidiunCall
	{
		public var filterFields : String;
		public function PlaylistDelete( id : String )
		{
			service= 'playlist';
			action= 'delete';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PlaylistDeleteDelegate( this , config );
		}
	}
}
