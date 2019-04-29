package com.vidiun.commands.accessControl
{
	import com.vidiun.vo.VidiunAccessControlFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.accessControl.AccessControlListDelegate;
	import com.vidiun.net.VidiunCall;

	public class AccessControlList extends VidiunCall
	{
		public var filterFields : String;
		public function AccessControlList( filter : VidiunAccessControlFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunAccessControlFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'accesscontrol';
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
			delegate = new AccessControlListDelegate( this , config );
		}
	}
}
