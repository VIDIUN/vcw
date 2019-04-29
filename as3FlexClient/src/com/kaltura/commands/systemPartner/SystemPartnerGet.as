package com.vidiun.commands.systemPartner
{
	import com.vidiun.delegates.systemPartner.SystemPartnerGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemPartnerGet extends VidiunCall
	{
		public var filterFields : String;
		public function SystemPartnerGet( partnerId : int )
		{
			service= 'systempartner_systempartner';
			action= 'get';

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
			delegate = new SystemPartnerGetDelegate( this , config );
		}
	}
}
