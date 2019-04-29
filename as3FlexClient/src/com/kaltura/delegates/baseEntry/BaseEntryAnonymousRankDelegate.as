package com.vidiun.delegates.baseEntry
{
	import flash.utils.getDefinitionByName;
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.net.VidiunCall;
	import com.vidiun.delegates.WebDelegateBase;
	public class BaseEntryAnonymousRankDelegate extends WebDelegateBase
	{
		public function BaseEntryAnonymousRankDelegate(call:VidiunCall, config:VidiunConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			return '';
		}

	}
}
