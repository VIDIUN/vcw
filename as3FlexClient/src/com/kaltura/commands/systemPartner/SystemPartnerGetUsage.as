package com.vidiun.commands.systemPartner
{
	import com.vidiun.vo.VidiunPartnerFilter;
	import com.vidiun.vo.VidiunSystemPartnerUsageFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.systemPartner.SystemPartnerGetUsageDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemPartnerGetUsage extends VidiunCall
	{
		public var filterFields : String;
		public function SystemPartnerGetUsage( partnerFilter : VidiunPartnerFilter=null,usageFilter : VidiunSystemPartnerUsageFilter=null,pager : VidiunFilterPager=null )
		{
			if(partnerFilter== null)partnerFilter= new VidiunPartnerFilter();
			if(usageFilter== null)usageFilter= new VidiunSystemPartnerUsageFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'systempartner_systempartner';
			action= 'getUsage';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(partnerFilter,'partnerFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(usageFilter,'usageFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = vidiunObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPartnerGetUsageDelegate( this , config );
		}
	}
}
