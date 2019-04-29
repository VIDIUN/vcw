package com.vidiun.commands.uploadToken
{
	import com.vidiun.vo.VidiunUploadTokenFilter;
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.uploadToken.UploadTokenListDelegate;
	import com.vidiun.net.VidiunCall;

	public class UploadTokenList extends VidiunCall
	{
		public var filterFields : String;
		public function UploadTokenList( filter : VidiunUploadTokenFilter=null,pager : VidiunFilterPager=null )
		{
			if(filter== null)filter= new VidiunUploadTokenFilter();
			if(pager== null)pager= new VidiunFilterPager();
			service= 'uploadtoken';
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
			delegate = new UploadTokenListDelegate( this , config );
		}
	}
}
