package com.vidiun.delegates.flavorParamsOutput
{
	import com.vidiun.core.VClassFactory;

	import flash.utils.getDefinitionByName;
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.net.VidiunCall;
	import com.vidiun.delegates.WebDelegateBase;
	public class FlavorParamsOutputListDelegate extends WebDelegateBase
	{
		public function FlavorParamsOutputListDelegate(call:VidiunCall, config:VidiunConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			var cls : Class = getDefinitionByName('com.vidiun.vo.'+ result.result.objectType) as Class;
			var obj : * = (new VClassFactory( cls )).newInstanceFromXML( result.result );
			return obj;
		}

	}
}
