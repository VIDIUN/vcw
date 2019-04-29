package com.vidiun.commands.stats
{
	import com.vidiun.vo.VidiunCEError;
	import com.vidiun.delegates.stats.StatsReportVceErrorDelegate;
	import com.vidiun.net.VidiunCall;

	public class StatsReportVceError extends VidiunCall
	{
		public var filterFields : String;
		public function StatsReportVceError( vidiunCEError : VidiunCEError )
		{
			service= 'stats';
			action= 'reportVceError';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(vidiunCEError,'vidiunCEError');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StatsReportVceErrorDelegate( this , config );
		}
	}
}
