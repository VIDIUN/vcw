package com.vidiun.commands.systemUser
{
	import com.vidiun.delegates.systemUser.SystemUserSetNewPasswordDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemUserSetNewPassword extends VidiunCall
	{
		public var filterFields : String;
		public function SystemUserSetNewPassword( userId : int,password : String )
		{
			service= 'systemuser_systemuser';
			action= 'setNewPassword';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'userId' );
			valueArr.push( userId );
			keyArr.push( 'password' );
			valueArr.push( password );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUserSetNewPasswordDelegate( this , config );
		}
	}
}
