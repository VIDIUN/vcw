package com.vidiun.delegates.storageProfile
{
	import flash.utils.getDefinitionByName;
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.net.VidiunCall;
	import com.vidiun.delegates.WebDelegateBase;
	public class StorageProfileUpdateStatusDelegate extends WebDelegateBase
	{
		public function StorageProfileUpdateStatusDelegate(call:VidiunCall, config:VidiunConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			return '';
		}

	}
}
