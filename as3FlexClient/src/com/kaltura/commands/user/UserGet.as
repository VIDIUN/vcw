package com.vidiun.commands.user
{
	import com.vidiun.delegates.user.UserGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class UserGet extends VidiunCall
	{
		public var filterFields : String;
		public function UserGet( userId : String )
		{
			service= 'user';
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
			delegate = new UserGetDelegate( this , config );
		}
	}
}
