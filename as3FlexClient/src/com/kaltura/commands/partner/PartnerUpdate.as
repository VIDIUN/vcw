package com.vidiun.commands.partner
{
	import com.vidiun.vo.VidiunPartner;
	import com.vidiun.delegates.partner.PartnerUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class PartnerUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function PartnerUpdate( partner : VidiunPartner,allowEmpty : Boolean=false )
		{
			service= 'partner';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(partner,'partner');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'allowEmpty' );
			valueArr.push( allowEmpty );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PartnerUpdateDelegate( this , config );
		}
	}
}
