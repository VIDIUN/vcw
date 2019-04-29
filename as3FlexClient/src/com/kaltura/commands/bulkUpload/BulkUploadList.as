package com.vidiun.commands.bulkUpload
{
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.bulkUpload.BulkUploadListDelegate;
	import com.vidiun.net.VidiunCall;

	public class BulkUploadList extends VidiunCall
	{
		public var filterFields : String;
		public function BulkUploadList( pager : VidiunFilterPager=null )
		{
			if(pager== null)pager= new VidiunFilterPager();
			service= 'bulkupload';
			action= 'list';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BulkUploadListDelegate( this , config );
		}
	}
}
