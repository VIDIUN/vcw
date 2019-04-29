package com.vidiun.commands.metadataBatch
{
	import com.vidiun.vo.VidiunMediaInfo;
	import com.vidiun.delegates.metadataBatch.MetadataBatchAddMediaInfoDelegate;
	import com.vidiun.net.VidiunCall;

	public class MetadataBatchAddMediaInfo extends VidiunCall
	{
		public var filterFields : String;
		public function MetadataBatchAddMediaInfo( mediaInfo : VidiunMediaInfo )
		{
			service= 'metadata_metadatabatch';
			action= 'addMediaInfo';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(mediaInfo,'mediaInfo');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchAddMediaInfoDelegate( this , config );
		}
	}
}
