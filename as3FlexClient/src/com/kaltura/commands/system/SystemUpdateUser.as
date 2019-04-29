package com.vidiun.commands.system
{
	import com.vidiun.vo.VidiunSystemUser;
	import com.vidiun.delegates.system.SystemUpdateUserDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemUpdateUser extends VidiunCall
	{
		public var filterFields : String;
		public function SystemUpdateUser( userId : int,systemUser : VidiunSystemUser )
		{
			service= 'system';
			action= 'updateUser';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'userId' );
			valueArr.push( userId );
 			keyValArr = vidiunObject2Arrays(systemUser,'systemUser');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUpdateUserDelegate( this , config );
		}
	}
}
