package com.vidiun.commands.stats
{
	import com.vidiun.vo.VidiunStatsEvent;
	import com.vidiun.delegates.stats.StatsCollectDelegate;
	import com.vidiun.net.VidiunCall;

	public class StatsCollect extends VidiunCall
	{
		public var filterFields : String;
		public function StatsCollect( event : VidiunStatsEvent )
		{
			service= 'stats';
			action= 'collect';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(event,'event');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StatsCollectDelegate( this , config );
		}
	}
}
