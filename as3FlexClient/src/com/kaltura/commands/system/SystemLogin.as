package com.vidiun.commands.system
{
	import com.vidiun.delegates.system.SystemLoginDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemLogin extends VidiunCall
	{
		public var filterFields : String;
		public function SystemLogin( email : String,password : String )
		{
			service= 'system';
			action= 'login';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'email' );
			valueArr.push( email );
			keyArr.push( 'password' );
			valueArr.push( password );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemLoginDelegate( this , config );
		}
	}
}
