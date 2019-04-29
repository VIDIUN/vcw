package com.vidiun.commands.storageProfile
{
	import com.vidiun.vo.VidiunPartnerFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.storageProfile.StorageProfileListByPartnerDelegate;
	import com.vidiun.net.VidiunCall;

	public class StorageProfileListByPartner extends VidiunCall
	{
		public var filterFields : String;
		public function StorageProfileListByPartner( filter : VidiunPartnerFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunPartnerFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'storageprofile_storageprofile';
			action= 'listByPartner';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(filter,'filter');
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
			delegate = new StorageProfileListByPartnerDelegate( this , config );
		}
	}
}
