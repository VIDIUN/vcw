package com.vidiun.commands.system
{
	import com.vidiun.delegates.system.SystemGetUserDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemGetUser extends VidiunCall
	{
		public var filterFields : String;
		public function SystemGetUser( userId : int )
		{
			service= 'system';
			action= 'getUser';

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
			delegate = new SystemGetUserDelegate( this , config );
		}
	}
}
