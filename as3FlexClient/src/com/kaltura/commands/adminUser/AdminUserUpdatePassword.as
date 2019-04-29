package com.vidiun.commands.adminUser
{
	import com.vidiun.delegates.adminUser.AdminUserUpdatePasswordDelegate;
	import com.vidiun.net.VidiunCall;

	public class AdminUserUpdatePassword extends VidiunCall
	{
		public var filterFields : String;
		public function AdminUserUpdatePassword( email : String,password : String,newEmail : String='',newPassword : String='' )
		{
			service= 'adminuser';
			action= 'updatePassword';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'email' );
			valueArr.push( email );
			keyArr.push( 'password' );
			valueArr.push( password );
			keyArr.push( 'newEmail' );
			valueArr.push( newEmail );
			keyArr.push( 'newPassword' );
			valueArr.push( newPassword );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new AdminUserUpdatePasswordDelegate( this , config );
		}
	}
}
