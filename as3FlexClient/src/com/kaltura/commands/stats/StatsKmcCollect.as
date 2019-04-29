package com.vidiun.commands.stats
{
	import com.vidiun.vo.VidiunStatsVmcEvent;
	import com.vidiun.delegates.stats.StatsVmcCollectDelegate;
	import com.vidiun.net.VidiunCall;

	public class StatsVmcCollect extends VidiunCall
	{
		public var filterFields : String;
		public function StatsVmcCollect( vmcEvent : VidiunStatsVmcEvent )
		{
			service= 'stats';
			action= 'vmcCollect';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(vmcEvent,'vmcEvent');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StatsVmcCollectDelegate( this , config );
		}
	}
}
