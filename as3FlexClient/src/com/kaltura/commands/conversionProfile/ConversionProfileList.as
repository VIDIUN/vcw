package com.vidiun.commands.conversionProfile
{
	import com.vidiun.vo.VidiunConversionProfileFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.conversionProfile.ConversionProfileListDelegate;
	import com.vidiun.net.VidiunCall;

	public class ConversionProfileList extends VidiunCall
	{
		public var filterFields : String;
		public function ConversionProfileList( filter : VidiunConversionProfileFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunConversionProfileFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'conversionprofile';
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
			delegate = new ConversionProfileListDelegate( this , config );
		}
	}
}
