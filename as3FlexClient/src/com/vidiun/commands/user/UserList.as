package com.vidiun.commands.user
{
	import com.vidiun.vo.VidiunUserFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.user.UserListDelegate;
	import com.vidiun.net.VidiunCall;

	public class UserList extends VidiunCall
	{
		public var filterFields : String;
		public function UserList( filter : VidiunUserFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunUserFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'user';
			action= 'list';

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
			delegate = new UserListDelegate( this , config );
		}
	}
}
