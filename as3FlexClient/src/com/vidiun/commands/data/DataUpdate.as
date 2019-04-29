package com.vidiun.commands.data
{
	import com.vidiun.vo.VidiunDataEntry;
	import com.vidiun.delegates.data.DataUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class DataUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function DataUpdate( entryId : String,documentEntry : VidiunDataEntry )
		{
			service= 'data';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = vidiunObject2Arrays(documentEntry,'documentEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new DataUpdateDelegate( this , config );
		}
	}
}
