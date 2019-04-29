package com.vidiun.delegates.conversionProfile
{
	import flash.utils.getDefinitionByName;
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.net.VidiunCall;
	import com.vidiun.delegates.WebDelegateBase;
	public class ConversionProfileAddFlavorParamsDelegate extends WebDelegateBase
	{
		public function ConversionProfileAddFlavorParamsDelegate(call:VidiunCall, config:VidiunConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			return '';
		}

	}
}
