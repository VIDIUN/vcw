package com.vidiun.commands.media
{
	import com.vidiun.delegates.media.MediaAnonymousRankDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaAnonymousRank extends VidiunCall
	{
		public var filterFields : String;
		public function MediaAnonymousRank( entryId : String,rank : int )
		{
			service= 'media';
			action= 'anonymousRank';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'rank' );
			valueArr.push( rank );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaAnonymousRankDelegate( this , config );
		}
	}
}
