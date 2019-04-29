package com.vidiun.commands.uiConf
{
	import com.vidiun.delegates.uiConf.UiConfDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class UiConfDelete extends VidiunCall
	{
		public var filterFields : String;
		public function UiConfDelete( id : int )
		{
			service= 'uiconf';
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
			delegate = new UiConfDeleteDelegate( this , config );
		}
	}
}
