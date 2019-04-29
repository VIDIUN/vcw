package com.vidiun.commands.syndicationFeed
{
	import com.vidiun.delegates.syndicationFeed.SyndicationFeedDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class SyndicationFeedDelete extends VidiunCall
	{
		public var filterFields : String;
		public function SyndicationFeedDelete( id : String )
		{
			service= 'syndicationfeed';
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
			delegate = new SyndicationFeedDeleteDelegate( this , config );
		}
	}
}
