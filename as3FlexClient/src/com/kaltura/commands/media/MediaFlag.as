package com.vidiun.commands.media
{
	import com.vidiun.vo.VidiunModerationFlag;
	import com.vidiun.delegates.media.MediaFlagDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaFlag extends VidiunCall
	{
		public var filterFields : String;
		public function MediaFlag( moderationFlag : VidiunModerationFlag )
		{
			service= 'media';
			action= 'flag';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(moderationFlag,'moderationFlag');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaFlagDelegate( this , config );
		}
	}
}
