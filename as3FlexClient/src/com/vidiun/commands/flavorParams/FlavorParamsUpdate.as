package com.vidiun.commands.flavorParams
{
	import com.vidiun.vo.VidiunFlavorParams;
	import com.vidiun.delegates.flavorParams.FlavorParamsUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorParamsUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorParamsUpdate( id : int,flavorParams : VidiunFlavorParams )
		{
			service= 'flavorparams';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(flavorParams,'flavorParams');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FlavorParamsUpdateDelegate( this , config );
		}
	}
}
