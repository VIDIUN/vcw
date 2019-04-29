package com.vidiun.commands.mixing
{
	import com.vidiun.delegates.mixing.MixingDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class MixingDelete extends VidiunCall
	{
		public var filterFields : String;
		public function MixingDelete( entryId : String )
		{
			service= 'mixing';
			action= 'delete';

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
			delegate = new MixingDeleteDelegate( this , config );
		}
	}
}
