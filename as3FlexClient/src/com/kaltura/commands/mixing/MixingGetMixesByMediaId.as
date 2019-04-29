package com.vidiun.commands.mixing
{
	import com.vidiun.delegates.mixing.MixingGetMixesByMediaIdDelegate;
	import com.vidiun.net.VidiunCall;

	public class MixingGetMixesByMediaId extends VidiunCall
	{
		public var filterFields : String;
		public function MixingGetMixesByMediaId( mediaEntryId : String )
		{
			service= 'mixing';
			action= 'getMixesByMediaId';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'mediaEntryId' );
			valueArr.push( mediaEntryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingGetMixesByMediaIdDelegate( this , config );
		}
	}
}
