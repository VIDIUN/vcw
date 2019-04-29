package com.vidiun.commands.report
{
	import com.vidiun.vo.VidiunReportInputFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.report.ReportGetUrlForReportAsCsvDelegate;
	import com.vidiun.net.VidiunCall;

	public class ReportGetUrlForReportAsCsv extends VidiunCall
	{
		public var filterFields : String;
		public function ReportGetUrlForReportAsCsv( reportTitle : String,reportText : String,headers : String,reportType : int,reportInputFilter : VidiunReportInputFilter,dimension : String='',pager : VidiunFilterPager=null,order : String='',objectIds : String='' )
		{
			if(pager== null)pager= new VidiunFilterPager();
			service= 'report';
			action= 'getUrlForReportAsCsv';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'reportTitle' );
			valueArr.push( reportTitle );
			keyArr.push( 'reportText' );
			valueArr.push( reportText );
			keyArr.push( 'headers' );
			valueArr.push( headers );
			keyArr.push( 'reportType' );
			valueArr.push( reportType );
 			keyValArr = vidiunObject2Arrays(reportInputFilter,'reportInputFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'dimension' );
			valueArr.push( dimension );
 			keyValArr = vidiunObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'order' );
			valueArr.push( order );
			keyArr.push( 'objectIds' );
			valueArr.push( objectIds );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ReportGetUrlForReportAsCsvDelegate( this , config );
		}
	}
}
