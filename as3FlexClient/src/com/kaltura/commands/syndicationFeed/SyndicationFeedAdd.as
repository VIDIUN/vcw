package com.vidiun.commands.syndicationFeed
{
	import com.vidiun.vo.VidiunBaseSyndicationFeed;
	import com.vidiun.delegates.syndicationFeed.SyndicationFeedAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class SyndicationFeedAdd extends VidiunCall
	{
		public var filterFields : String;
		public function SyndicationFeedAdd( syndicationFeed : VidiunBaseSyndicationFeed )
		{
			service= 'syndicationfeed';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(syndicationFeed,'syndicationFeed');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SyndicationFeedAddDelegate( this , config );
		}
	}
}
