package com.vidiun.commands.user
{
	import com.vidiun.vo.VidiunUser;
	import com.vidiun.delegates.user.UserUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class UserUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function UserUpdate( userId : String,user : VidiunUser )
		{
			service= 'user';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'userId' );
			valueArr.push( userId );
 			keyValArr = vidiunObject2Arrays(user,'user');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UserUpdateDelegate( this , config );
		}
	}
}
