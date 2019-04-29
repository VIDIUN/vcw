package com.vidiun.commands.conversionProfile
{
	import com.vidiun.vo.VidiunFlavorAsset;
	import com.vidiun.vo.VidiunFlavorParams;
	import com.vidiun.delegates.conversionProfile.ConversionProfileDummyDelegate;
	import com.vidiun.net.VidiunCall;

	public class ConversionProfileDummy extends VidiunCall
	{
		public var filterFields : String;
		public function ConversionProfileDummy( a : VidiunFlavorAsset,b : VidiunFlavorParams )
		{
			service= 'conversionProfile';
			action= 'dummy';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(a,'a');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(b,'b');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ConversionProfileDummyDelegate( this , config );
		}
	}
}
