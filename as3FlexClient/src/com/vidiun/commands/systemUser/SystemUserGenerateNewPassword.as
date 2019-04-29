package com.vidiun.commands.systemUser
{
	import com.vidiun.delegates.systemUser.SystemUserGenerateNewPasswordDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemUserGenerateNewPassword extends VidiunCall
	{
		public var filterFields : String;
		public function SystemUserGenerateNewPassword(  )
		{
			service= 'systemuser_systemuser';
			action= 'generateNewPassword';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUserGenerateNewPasswordDelegate( this , config );
		}
	}
}
