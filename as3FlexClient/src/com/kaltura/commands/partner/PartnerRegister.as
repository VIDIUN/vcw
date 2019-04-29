package com.vidiun.commands.partner
{
	import com.vidiun.vo.VidiunPartner;
	import com.vidiun.delegates.partner.PartnerRegisterDelegate;
	import com.vidiun.net.VidiunCall;

	public class PartnerRegister extends VidiunCall
	{
		public var filterFields : String;
		public function PartnerRegister( partner : VidiunPartner,cmsPassword : String='' )
		{
			service= 'partner';
			action= 'register';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(partner,'partner');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'cmsPassword' );
			valueArr.push( cmsPassword );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PartnerRegisterDelegate( this , config );
		}
	}
}
