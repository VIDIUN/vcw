package com.vidiun.delegates.xInternal
{
	import flash.utils.getDefinitionByName;
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.net.VidiunCall;
	import com.vidiun.delegates.WebDelegateBase;
	public class XInternalXAddBulkDownloadDelegate extends WebDelegateBase
	{
		public function XInternalXAddBulkDownloadDelegate(call:VidiunCall, config:VidiunConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			return result.result.toString();
		}

	}
}
