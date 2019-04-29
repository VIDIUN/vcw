package com.vidiun.commands.systemUser
{
	import com.vidiun.vo.VidiunSystemUser;
	import com.vidiun.delegates.systemUser.SystemUserAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemUserAdd extends VidiunCall
	{
		public var filterFields : String;
		public function SystemUserAdd( systemUser : VidiunSystemUser )
		{
			service= 'systemuser_systemuser';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(systemUser,'systemUser');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUserAddDelegate( this , config );
		}
	}
}
