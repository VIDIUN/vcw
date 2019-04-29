package com.vidiun.commands.uiConf
{
	import com.vidiun.vo.VidiunUiConf;
	import com.vidiun.delegates.uiConf.UiConfUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class UiConfUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function UiConfUpdate( id : int,uiConf : VidiunUiConf )
		{
			service= 'uiconf';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(uiConf,'uiConf');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UiConfUpdateDelegate( this , config );
		}
	}
}
