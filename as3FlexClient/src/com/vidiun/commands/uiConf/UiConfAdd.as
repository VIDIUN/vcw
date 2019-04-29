package com.vidiun.commands.uiConf
{
	import com.vidiun.vo.VidiunUiConf;
	import com.vidiun.delegates.uiConf.UiConfAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class UiConfAdd extends VidiunCall
	{
		public var filterFields : String;
		public function UiConfAdd( uiConf : VidiunUiConf )
		{
			service= 'uiconf';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(uiConf,'uiConf');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UiConfAddDelegate( this , config );
		}
	}
}
