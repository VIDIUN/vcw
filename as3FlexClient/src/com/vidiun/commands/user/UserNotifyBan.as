package com.vidiun.commands.user
{
	import com.vidiun.delegates.user.UserNotifyBanDelegate;
	import com.vidiun.net.VidiunCall;

	public class UserNotifyBan extends VidiunCall
	{
		public var filterFields : String;
		public function UserNotifyBan( userId : String )
		{
			service= 'user';
			action= 'notifyBan';

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
			delegate = new UserNotifyBanDelegate( this , config );
		}
	}
}
