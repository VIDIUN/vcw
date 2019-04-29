package com.vidiun.commands.fileSync
{
	import com.vidiun.vo.VidiunFileSyncFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.fileSync.FileSyncListDelegate;
	import com.vidiun.net.VidiunCall;

	public class FileSyncList extends VidiunCall
	{
		public var filterFields : String;
		public function FileSyncList( filter : VidiunFileSyncFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunFileSyncFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'filesync_filesync';
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
			delegate = new FileSyncListDelegate( this , config );
		}
	}
}
