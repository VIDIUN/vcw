package com.vidiun.commands.media
{
	import com.vidiun.vo.VidiunMediaEntryFilter;
	import com.vidiun.delegates.media.MediaCountDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaCount extends VidiunCall
	{
		public var filterFields : String;
		public function MediaCount( filter : VidiunMediaEntryFilter=null )
		{
			if(filter== null)filter= new VidiunMediaEntryFilter();
			service= 'media';
			action= 'count';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaCountDelegate( this , config );
		}
	}
}
