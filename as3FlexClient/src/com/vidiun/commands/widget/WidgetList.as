package com.vidiun.commands.widget
{
	import com.vidiun.vo.VidiunWidgetFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.widget.WidgetListDelegate;
	import com.vidiun.net.VidiunCall;

	public class WidgetList extends VidiunCall
	{
		public var filterFields : String;
		public function WidgetList( filter : VidiunWidgetFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunWidgetFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'widget';
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
			delegate = new WidgetListDelegate( this , config );
		}
	}
}
