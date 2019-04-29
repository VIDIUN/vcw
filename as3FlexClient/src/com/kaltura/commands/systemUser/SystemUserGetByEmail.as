package com.vidiun.commands.systemUser
{
	import com.vidiun.delegates.systemUser.SystemUserGetByEmailDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemUserGetByEmail extends VidiunCall
	{
		public var filterFields : String;
		public function SystemUserGetByEmail( email : String )
		{
			service= 'systemuser_systemuser';
			action= 'getByEmail';

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
			delegate = new SystemUserGetByEmailDelegate( this , config );
		}
	}
}
