package com.vidiun.commands.data
{
	import com.vidiun.vo.VidiunDataEntryFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.data.DataListDelegate;
	import com.vidiun.net.VidiunCall;

	public class DataList extends VidiunCall
	{
		public var filterFields : String;
		public function DataList( filter : VidiunDataEntryFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunDataEntryFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'data';
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
			delegate = new DataListDelegate( this , config );
		}
	}
}
