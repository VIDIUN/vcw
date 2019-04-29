package com.vidiun.delegates.report
{
	import flash.utils.getDefinitionByName;
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.net.VidiunCall;
	import com.vidiun.delegates.WebDelegateBase;
	public class ReportGetUrlForReportAsCsvDelegate extends WebDelegateBase
	{
		public function ReportGetUrlForReportAsCsvDelegate(call:VidiunCall, config:VidiunConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			return result.result.toString();
		}

	}
}
