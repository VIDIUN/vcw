package com.vidiun.commands.mixing
{
	import com.vidiun.delegates.mixing.MixingCloneDelegate;
	import com.vidiun.net.VidiunCall;

	public class MixingClone extends VidiunCall
	{
		public var filterFields : String;
		public function MixingClone( entryId : String )
		{
			service= 'mixing';
			action= 'clone';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingCloneDelegate( this , config );
		}
	}
}
