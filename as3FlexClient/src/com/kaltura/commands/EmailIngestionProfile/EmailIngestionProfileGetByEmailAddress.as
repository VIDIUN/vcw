package com.vidiun.commands.EmailIngestionProfile
{
	import com.vidiun.delegates.EmailIngestionProfile.EmailIngestionProfileGetByEmailAddressDelegate;
	import com.vidiun.net.VidiunCall;

	public class EmailIngestionProfileGetByEmailAddress extends VidiunCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileGetByEmailAddress( emailAddress : String )
		{
			service= 'emailingestionprofile';
			action= 'getByEmailAddress';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'emailAddress' );
			valueArr.push( emailAddress );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EmailIngestionProfileGetByEmailAddressDelegate( this , config );
		}
	}
}
