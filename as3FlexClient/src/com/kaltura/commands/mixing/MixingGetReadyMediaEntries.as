package com.vidiun.commands.mixing
{
	import com.vidiun.delegates.mixing.MixingGetReadyMediaEntriesDelegate;
	import com.vidiun.net.VidiunCall;

	public class MixingGetReadyMediaEntries extends VidiunCall
	{
		public var filterFields : String;
		public function MixingGetReadyMediaEntries( mixId : String,version : int=-1 )
		{
			service= 'mixing';
			action= 'getReadyMediaEntries';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'mixId' );
			valueArr.push( mixId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingGetReadyMediaEntriesDelegate( this , config );
		}
	}
}
