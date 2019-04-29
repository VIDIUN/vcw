package com.vidiun.commands.conversionProfile
{
	import com.vidiun.delegates.conversionProfile.ConversionProfileGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class ConversionProfileGet extends VidiunCall
	{
		public var filterFields : String;
		public function ConversionProfileGet( id : int )
		{
			service= 'conversionprofile';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ConversionProfileGetDelegate( this , config );
		}
	}
}
