package com.vidiun.commands.uiConf
{
	import com.vidiun.vo.VidiunUiConfFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.uiConf.UiConfListTemplatesDelegate;
	import com.vidiun.net.VidiunCall;

	public class UiConfListTemplates extends VidiunCall
	{
		public var filterFields : String;
		public function UiConfListTemplates( filter : VidiunUiConfFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunUiConfFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'uiconf';
			action= 'listTemplates';

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
			delegate = new UiConfListTemplatesDelegate( this , config );
		}
	}
}
