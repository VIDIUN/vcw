package com.vidiun.commands.system
{
	import com.vidiun.vo.VidiunSystemUserFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.system.SystemListUsersDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemListUsers extends VidiunCall
	{
		public var filterFields : String;
		public function SystemListUsers( filter : VidiunSystemUserFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunSystemUserFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'system';
			action= 'listUsers';

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
			delegate = new SystemListUsersDelegate( this , config );
		}
	}
}
