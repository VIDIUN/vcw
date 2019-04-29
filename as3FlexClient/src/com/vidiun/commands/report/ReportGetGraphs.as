package com.vidiun.commands.report
{
	import com.vidiun.vo.VidiunReportInputFilter;
	import com.vidiun.delegates.report.ReportGetGraphsDelegate;
	import com.vidiun.net.VidiunCall;

	public class ReportGetGraphs extends VidiunCall
	{
		public var filterFields : String;
		public function ReportGetGraphs( reportType : int,reportInputFilter : VidiunReportInputFilter,dimension : String='',objectIds : String='' )
		{
			service= 'report';
			action= 'getGraphs';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'reportType' );
			valueArr.push( reportType );
 			keyValArr = vidiunObject2Arrays(reportInputFilter,'reportInputFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'dimension' );
			valueArr.push( dimension );
			keyArr.push( 'objectIds' );
			valueArr.push( objectIds );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ReportGetGraphsDelegate( this , config );
		}
	}
}
