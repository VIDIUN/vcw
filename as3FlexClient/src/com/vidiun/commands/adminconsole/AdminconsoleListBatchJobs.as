package com.vidiun.commands.adminconsole
{
	import com.vidiun.vo.VidiunPartnerFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.adminconsole.AdminconsoleListBatchJobsDelegate;
	import com.vidiun.net.VidiunCall;

	public class AdminconsoleListBatchJobs extends VidiunCall
	{
		public var filterFields : String;
		public function AdminconsoleListBatchJobs( filter : VidiunPartnerFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunPartnerFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'adminconsole';
			action= 'listBatchJobs';

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
			delegate = new AdminconsoleListBatchJobsDelegate( this , config );
		}
	}
}
