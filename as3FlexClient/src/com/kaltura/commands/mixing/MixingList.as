package com.vidiun.commands.mixing
{
	import com.vidiun.vo.VidiunMixEntryFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.mixing.MixingListDelegate;
	import com.vidiun.net.VidiunCall;

	public class MixingList extends VidiunCall
	{
		public var filterFields : String;
		public function MixingList( filter : VidiunMixEntryFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunMixEntryFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'mixing';
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
			delegate = new MixingListDelegate( this , config );
		}
	}
}
