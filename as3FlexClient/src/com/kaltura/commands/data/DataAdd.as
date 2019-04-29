package com.vidiun.commands.data
{
	import com.vidiun.vo.VidiunDataEntry;
	import com.vidiun.delegates.data.DataAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class DataAdd extends VidiunCall
	{
		public var filterFields : String;
		public function DataAdd( dataEntry : VidiunDataEntry )
		{
			service= 'data';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(dataEntry,'dataEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new DataAddDelegate( this , config );
		}
	}
}
