package com.vidiun.commands.uiConf
{
	import com.vidiun.delegates.uiConf.UiConfCloneDelegate;
	import com.vidiun.net.VidiunCall;

	public class UiConfClone extends VidiunCall
	{
		public var filterFields : String;
		public function UiConfClone( id : int )
		{
			service= 'uiconf';
			action= 'clone';

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
			delegate = new UiConfCloneDelegate( this , config );
		}
	}
}
