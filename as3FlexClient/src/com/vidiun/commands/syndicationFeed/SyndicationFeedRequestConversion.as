package com.vidiun.commands.syndicationFeed
{
	import com.vidiun.delegates.syndicationFeed.SyndicationFeedRequestConversionDelegate;
	import com.vidiun.net.VidiunCall;

	public class SyndicationFeedRequestConversion extends VidiunCall
	{
		public var filterFields : String;
		public function SyndicationFeedRequestConversion( feedId : String )
		{
			service= 'syndicationfeed';
			action= 'requestConversion';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'feedId' );
			valueArr.push( feedId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SyndicationFeedRequestConversionDelegate( this , config );
		}
	}
}
