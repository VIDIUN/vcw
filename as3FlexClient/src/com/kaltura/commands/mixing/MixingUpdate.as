package com.vidiun.commands.mixing
{
	import com.vidiun.vo.VidiunMixEntry;
	import com.vidiun.delegates.mixing.MixingUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class MixingUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function MixingUpdate( entryId : String,mixEntry : VidiunMixEntry )
		{
			service= 'mixing';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = vidiunObject2Arrays(mixEntry,'mixEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingUpdateDelegate( this , config );
		}
	}
}
