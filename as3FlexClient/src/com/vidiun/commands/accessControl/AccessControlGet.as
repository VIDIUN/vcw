package com.vidiun.commands.accessControl
{
	import com.vidiun.delegates.accessControl.AccessControlGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class AccessControlGet extends VidiunCall
	{
		public var filterFields : String;
		public function AccessControlGet( id : int )
		{
			service= 'accesscontrol';
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
			delegate = new AccessControlGetDelegate( this , config );
		}
	}
}
