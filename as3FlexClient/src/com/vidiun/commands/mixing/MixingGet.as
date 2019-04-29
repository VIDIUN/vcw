package com.vidiun.commands.mixing
{
	import com.vidiun.delegates.mixing.MixingGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class MixingGet extends VidiunCall
	{
		public var filterFields : String;
		public function MixingGet( entryId : String,version : int=-1 )
		{
			service= 'mixing';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingGetDelegate( this , config );
		}
	}
}
