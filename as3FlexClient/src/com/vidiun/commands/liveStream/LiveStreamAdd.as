package com.vidiun.commands.liveStream
{
	import com.vidiun.vo.VidiunLiveStreamAdminEntry;
	import com.vidiun.delegates.liveStream.LiveStreamAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class LiveStreamAdd extends VidiunCall
	{
		public var filterFields : String;
		public function LiveStreamAdd( liveStreamEntry : VidiunLiveStreamAdminEntry )
		{
			service= 'livestream';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(liveStreamEntry,'liveStreamEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new LiveStreamAddDelegate( this , config );
		}
	}
}
