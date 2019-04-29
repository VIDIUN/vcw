package com.vidiun.commands.baseEntry
{
	import com.vidiun.vo.VidiunBaseEntryFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.baseEntry.BaseEntryListDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryList extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryList( filter : VidiunBaseEntryFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunBaseEntryFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'baseentry';
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
			delegate = new BaseEntryListDelegate( this , config );
		}
	}
}
