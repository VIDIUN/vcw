package com.vidiun.commands.system
{
	import com.vidiun.vo.VidiunSystemUser;
	import com.vidiun.delegates.system.SystemAddUserDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemAddUser extends VidiunCall
	{
		public var filterFields : String;
		public function SystemAddUser( systemUser : VidiunSystemUser )
		{
			service= 'system';
			action= 'addUser';

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
			delegate = new SystemAddUserDelegate( this , config );
		}
	}
}
