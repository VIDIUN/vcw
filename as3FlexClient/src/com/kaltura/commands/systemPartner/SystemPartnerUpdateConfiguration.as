package com.vidiun.commands.systemPartner
{
	import com.vidiun.vo.VidiunSystemPartnerConfiguration;
	import com.vidiun.delegates.systemPartner.SystemPartnerUpdateConfigurationDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemPartnerUpdateConfiguration extends VidiunCall
	{
		public var filterFields : String;
		public function SystemPartnerUpdateConfiguration( partnerId : int,configuration : VidiunSystemPartnerConfiguration )
		{
			service= 'systempartner_systempartner';
			action= 'updateConfiguration';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'partnerId' );
			valueArr.push( partnerId );
 			keyValArr = vidiunObject2Arrays(configuration,'configuration');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPartnerUpdateConfigurationDelegate( this , config );
		}
	}
}
