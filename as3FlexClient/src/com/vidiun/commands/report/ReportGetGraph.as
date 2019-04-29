package com.vidiun.commands.report
{
	import com.vidiun.delegates.report.ReportGetGraphDelegate;
	import com.vidiun.net.VidiunCall;

	public class ReportGetGraph extends VidiunCall
	{
		public var filterFields : String;
		public function ReportGetGraph(  )
		{
			service= 'report';
			action= 'getGraph';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ReportGetGraphDelegate( this , config );
		}
	}
}
