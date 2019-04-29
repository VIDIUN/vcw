package com.vidiun.commands.mixing
{
	import com.vidiun.vo.VidiunMixEntry;
	import com.vidiun.delegates.mixing.MixingAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class MixingAdd extends VidiunCall
	{
		public var filterFields : String;
		public function MixingAdd( mixEntry : VidiunMixEntry )
		{
			service= 'mixing';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(mixEntry,'mixEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingAddDelegate( this , config );
		}
	}
}