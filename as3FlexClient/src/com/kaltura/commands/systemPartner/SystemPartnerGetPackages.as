package com.vidiun.commands.systemPartner
{
	import com.vidiun.delegates.systemPartner.SystemPartnerGetPackagesDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemPartnerGetPackages extends VidiunCall
	{
		public var filterFields : String;
		public function SystemPartnerGetPackages(  )
		{
			service= 'systempartner_systempartner';
			action= 'getPackages';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPartnerGetPackagesDelegate( this , config );
		}
	}
}
