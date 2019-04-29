package com.vidiun.commands.systemUser
{
	import com.vidiun.delegates.systemUser.SystemUserGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemUserGet extends VidiunCall
	{
		public var filterFields : String;
		public function SystemUserGet( userId : int )
		{
			service= 'systemuser_systemuser';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'userId' );
			valueArr.push( userId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUserGetDelegate( this , config );
		}
	}
}
