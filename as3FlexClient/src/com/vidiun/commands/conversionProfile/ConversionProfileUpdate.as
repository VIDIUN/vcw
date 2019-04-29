package com.vidiun.commands.conversionProfile
{
	import com.vidiun.vo.VidiunConversionProfile;
	import com.vidiun.delegates.conversionProfile.ConversionProfileUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class ConversionProfileUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function ConversionProfileUpdate( id : int,conversionProfile : VidiunConversionProfile )
		{
			service= 'conversionprofile';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(conversionProfile,'conversionProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ConversionProfileUpdateDelegate( this , config );
		}
	}
}
