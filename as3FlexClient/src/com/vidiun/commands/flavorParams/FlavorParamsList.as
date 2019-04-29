package com.vidiun.commands.flavorParams
{
	import com.vidiun.vo.VidiunFlavorParamsFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.flavorParams.FlavorParamsListDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorParamsList extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorParamsList( filter : VidiunFlavorParamsFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunFlavorParamsFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'flavorparams';
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
			delegate = new FlavorParamsListDelegate( this , config );
		}
	}
}
