package com.vidiun.commands.baseEntry
{
	import com.vidiun.vo.VidiunEntryContextDataParams;
	import com.vidiun.delegates.baseEntry.BaseEntryGetContextDataDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryGetContextData extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryGetContextData( entryId : String,contextDataParams : VidiunEntryContextDataParams )
		{
			service= 'baseentry';
			action= 'getContextData';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = vidiunObject2Arrays(contextDataParams,'contextDataParams');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryGetContextDataDelegate( this , config );
		}
	}
}
