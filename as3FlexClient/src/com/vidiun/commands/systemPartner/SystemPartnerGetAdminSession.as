package com.vidiun.commands.systemPartner
{
	import com.vidiun.delegates.systemPartner.SystemPartnerGetAdminSessionDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemPartnerGetAdminSession extends VidiunCall
	{
		public var filterFields : String;
		public function SystemPartnerGetAdminSession( partnerId : int )
		{
			service= 'systempartner_systempartner';
			action= 'getAdminSession';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'partnerId' );
			valueArr.push( partnerId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPartnerGetAdminSessionDelegate( this , config );
		}
	}
}
