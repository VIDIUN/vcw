package com.vidiun.commands.baseEntry
{
	import com.vidiun.vo.VidiunEntryExtraDataParams;
	import com.vidiun.delegates.baseEntry.BaseEntryGetExtraDataDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryGetExtraData extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryGetExtraData( entryId : String,extraDataParams : VidiunEntryExtraDataParams )
		{
			service= 'baseEntry';
			action= 'getExtraData';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = vidiunObject2Arrays(extraDataParams,'extraDataParams');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryGetExtraDataDelegate( this , config );
		}
	}
}
