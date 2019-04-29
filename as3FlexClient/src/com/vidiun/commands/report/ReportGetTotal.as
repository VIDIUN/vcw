package com.vidiun.commands.report
{
	import com.vidiun.vo.VidiunReportInputFilter;
	import com.vidiun.delegates.report.ReportGetTotalDelegate;
	import com.vidiun.net.VidiunCall;

	public class ReportGetTotal extends VidiunCall
	{
		public var filterFields : String;
		public function ReportGetTotal( reportType : int,reportInputFilter : VidiunReportInputFilter,objectIds : String='' )
		{
			service= 'report';
			action= 'getTotal';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'reportType' );
			valueArr.push( reportType );
 			keyValArr = vidiunObject2Arrays(reportInputFilter,'reportInputFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'objectIds' );
			valueArr.push( objectIds );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ReportGetTotalDelegate( this , config );
		}
	}
}
