package com.vidiun.commands.accessControl
{
	import com.vidiun.delegates.accessControl.AccessControlDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class AccessControlDelete extends VidiunCall
	{
		public var filterFields : String;
		public function AccessControlDelete( id : int )
		{
			service= 'accesscontrol';
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
			delegate = new AccessControlDeleteDelegate( this , config );
		}
	}
}
