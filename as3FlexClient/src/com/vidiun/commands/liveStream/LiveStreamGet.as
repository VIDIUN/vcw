package com.vidiun.commands.liveStream
{
	import com.vidiun.delegates.liveStream.LiveStreamGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class LiveStreamGet extends VidiunCall
	{
		public var filterFields : String;
		public function LiveStreamGet( entryId : String,version : int=-1 )
		{
			service= 'livestream';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new LiveStreamGetDelegate( this , config );
		}
	}
}
