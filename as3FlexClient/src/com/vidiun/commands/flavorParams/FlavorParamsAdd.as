package com.vidiun.commands.flavorParams
{
	import com.vidiun.vo.VidiunFlavorParams;
	import com.vidiun.delegates.flavorParams.FlavorParamsAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorParamsAdd extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorParamsAdd( flavorParams : VidiunFlavorParams )
		{
			service= 'flavorparams';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(flavorParams,'flavorParams');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FlavorParamsAddDelegate( this , config );
		}
	}
}
