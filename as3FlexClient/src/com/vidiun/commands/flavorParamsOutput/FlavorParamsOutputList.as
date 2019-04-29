package com.vidiun.commands.flavorParamsOutput
{
	import com.vidiun.vo.VidiunFlavorParamsOutputFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.flavorParamsOutput.FlavorParamsOutputListDelegate;
	import com.vidiun.net.VidiunCall;

	public class FlavorParamsOutputList extends VidiunCall
	{
		public var filterFields : String;
		public function FlavorParamsOutputList( filter : VidiunFlavorParamsOutputFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunFlavorParamsOutputFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'adminconsole_flavorparamsoutput';
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
			delegate = new FlavorParamsOutputListDelegate( this , config );
		}
	}
}
