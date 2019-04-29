package com.vidiun.commands.syndicationFeed
{
	import com.vidiun.vo.VidiunBaseSyndicationFeed;
	import com.vidiun.delegates.syndicationFeed.SyndicationFeedUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class SyndicationFeedUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function SyndicationFeedUpdate( id : String,syndicationFeed : VidiunBaseSyndicationFeed )
		{
			service= 'syndicationfeed';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(syndicationFeed,'syndicationFeed');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SyndicationFeedUpdateDelegate( this , config );
		}
	}
}
