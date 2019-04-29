package com.vidiun.commands.uiConf
{
	import com.vidiun.delegates.uiConf.UiConfGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class UiConfGet extends VidiunCall
	{
		public var filterFields : String;
		public function UiConfGet( id : int )
		{
			service= 'uiconf';
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
			delegate = new UiConfGetDelegate( this , config );
		}
	}
}
