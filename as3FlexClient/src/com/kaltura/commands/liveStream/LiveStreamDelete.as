package com.vidiun.commands.liveStream
{
	import com.vidiun.delegates.liveStream.LiveStreamDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class LiveStreamDelete extends VidiunCall
	{
		public var filterFields : String;
		public function LiveStreamDelete( entryId : String )
		{
			service= 'livestream';
			action= 'delete';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new LiveStreamDeleteDelegate( this , config );
		}
	}
}
