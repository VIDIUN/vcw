package com.vidiun.commands.conversionProfile
{
	import com.vidiun.vo.VidiunConversionProfile;
	import com.vidiun.delegates.conversionProfile.ConversionProfileAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class ConversionProfileAdd extends VidiunCall
	{
		public var filterFields : String;
		public function ConversionProfileAdd( conversionProfile : VidiunConversionProfile )
		{
			service= 'conversionprofile';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(conversionProfile,'conversionProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ConversionProfileAddDelegate( this , config );
		}
	}
}
