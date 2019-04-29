package com.vidiun.commands.flavorParams
{
	import com.vidiun.delegates.flavorParams.FlavorParamsGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorParamsGet extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorParamsGet( id : int )
		{
			service= 'flavorparams';
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
			delegate = new FlavorParamsGetDelegate( this , config );
		}
	}
}
