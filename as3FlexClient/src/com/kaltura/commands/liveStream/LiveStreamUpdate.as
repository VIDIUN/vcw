package com.vidiun.commands.liveStream
{
	import com.vidiun.vo.VidiunLiveStreamAdminEntry;
	import com.vidiun.delegates.liveStream.LiveStreamUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class LiveStreamUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function LiveStreamUpdate( entryId : String,liveStreamEntry : VidiunLiveStreamAdminEntry )
		{
			service= 'livestream';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = vidiunObject2Arrays(liveStreamEntry,'liveStreamEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new LiveStreamUpdateDelegate( this , config );
		}
	}
}
