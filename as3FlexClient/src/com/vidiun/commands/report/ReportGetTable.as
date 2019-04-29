package com.vidiun.commands.report
{
	import com.vidiun.vo.VidiunReportInputFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.report.ReportGetTableDelegate;
	import com.vidiun.net.VidiunCall;

	public class ReportGetTable extends VidiunCall
	{
		public var filterFields : String;
		public function ReportGetTable( reportType : int,reportInputFilter : VidiunReportInputFilter,pager : VidiunFilterPager,order : String='',objectIds : String='' )
		{
			service= 'report';
			action= 'getTable';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'reportType' );
			valueArr.push( reportType );
 			keyValArr = vidiunObject2Arrays(reportInputFilter,'reportInputFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
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
			delegate = new ReportGetTableDelegate( this , config );
		}
	}
}
