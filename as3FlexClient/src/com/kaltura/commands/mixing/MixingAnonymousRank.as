package com.vidiun.commands.mixing
{
	import com.vidiun.delegates.mixing.MixingAnonymousRankDelegate;
	import com.vidiun.net.VidiunCall;

	public class MixingAnonymousRank extends VidiunCall
	{
		public var filterFields : String;
		public function MixingAnonymousRank( entryId : String,rank : int )
		{
			service= 'mixing';
			action= 'anonymousRank';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'rank' );
			valueArr.push( rank );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingAnonymousRankDelegate( this , config );
		}
	}
}
