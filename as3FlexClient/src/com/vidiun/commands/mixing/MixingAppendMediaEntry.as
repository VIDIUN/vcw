package com.vidiun.commands.mixing
{
	import com.vidiun.delegates.mixing.MixingAppendMediaEntryDelegate;
	import com.vidiun.net.VidiunCall;

	public class MixingAppendMediaEntry extends VidiunCall
	{
		public var filterFields : String;
		public function MixingAppendMediaEntry( mixEntryId : String,mediaEntryId : String )
		{
			service= 'mixing';
			action= 'appendMediaEntry';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'mixEntryId' );
			valueArr.push( mixEntryId );
			keyArr.push( 'mediaEntryId' );
			valueArr.push( mediaEntryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingAppendMediaEntryDelegate( this , config );
		}
	}
}
