package com.vidiun.commands.partner
{
	import com.vidiun.delegates.partner.PartnerGetInfoDelegate;
	import com.vidiun.net.VidiunCall;

	public class PartnerGetInfo extends VidiunCall
	{
		public var filterFields : String;
		public function PartnerGetInfo(  )
		{
			service= 'partner';
			action= 'getInfo';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PartnerGetInfoDelegate( this , config );
		}
	}
}
