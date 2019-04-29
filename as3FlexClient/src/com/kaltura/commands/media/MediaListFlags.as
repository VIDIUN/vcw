package com.vidiun.commands.media
{
	import com.vidiun.vo.VidiunFilterPager;
	import com.vidiun.delegates.media.MediaListFlagsDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaListFlags extends VidiunCall
	{
		public var filterFields : String;
		public function MediaListFlags( entryId : String,pager : VidiunFilterPager=null )
		{
			if(pager== null)pager= new VidiunFilterPager();
			service= 'media';
			action= 'listFlags';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = vidiunObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaListFlagsDelegate( this , config );
		}
	}
}
