package com.vidiun.commands.adminUser
{
	import com.vidiun.delegates.adminUser.AdminUserResetPasswordDelegate;
	import com.vidiun.net.VidiunCall;

	public class AdminUserResetPassword extends VidiunCall
	{
		public var filterFields : String;
		public function AdminUserResetPassword( email : String )
		{
			service= 'adminuser';
			action= 'resetPassword';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'email' );
			valueArr.push( email );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new AdminUserResetPasswordDelegate( this , config );
		}
	}
}
