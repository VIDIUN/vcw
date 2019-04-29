package com.vidiun.commands.baseEntry
{
	import com.vidiun.vo.VidiunBaseEntryFilter;
	import com.vidiun.delegates.baseEntry.BaseEntryCountDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryCount extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryCount( filter : VidiunBaseEntryFilter=null )
		{
			if(filter== null)filter= new VidiunBaseEntryFilter();
			service= 'baseentry';
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
			delegate = new BaseEntryCountDelegate( this , config );
		}
	}
}
