package com.vidiun.commands.system
{
	import com.vidiun.delegates.system.SystemGetUserByEmailDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemGetUserByEmail extends VidiunCall
	{
		public var filterFields : String;
		public function SystemGetUserByEmail( email : String )
		{
			service= 'system';
			action= 'getUserByEmail';

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
			delegate = new SystemGetUserByEmailDelegate( this , config );
		}
	}
}
