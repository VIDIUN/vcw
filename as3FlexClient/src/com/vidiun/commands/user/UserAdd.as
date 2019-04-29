package com.vidiun.commands.user
{
	import com.vidiun.vo.VidiunUser;
	import com.vidiun.delegates.user.UserAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class UserAdd extends VidiunCall
	{
		public var filterFields : String;
		public function UserAdd( user : VidiunUser )
		{
			service= 'user';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(user,'user');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UserAddDelegate( this , config );
		}
	}
}
