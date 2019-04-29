package com.vidiun.commands.conversionProfile
{
	import com.vidiun.delegates.conversionProfile.ConversionProfileDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class ConversionProfileDelete extends VidiunCall
	{
		public var filterFields : String;
		public function ConversionProfileDelete( id : int )
		{
			service= 'conversionprofile';
			action= 'delete';

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
			delegate = new ConversionProfileDeleteDelegate( this , config );
		}
	}
}
