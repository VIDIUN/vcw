package com.vidiun.commands.baseEntry
{
	import com.vidiun.vo.VidiunBaseEntry;
	import com.vidiun.delegates.baseEntry.BaseEntryAddFromUploadedFileDelegate;
	import com.vidiun.net.VidiunCall;

	public class BaseEntryAddFromUploadedFile extends VidiunCall
	{
		public var filterFields : String;
		public function BaseEntryAddFromUploadedFile( entry : VidiunBaseEntry,uploadTokenId : String,type : int=-1 )
		{
			service= 'baseentry';
			action= 'addFromUploadedFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(entry,'entry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'uploadTokenId' );
			valueArr.push( uploadTokenId );
			keyArr.push( 'type' );
			valueArr.push( type );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryAddFromUploadedFileDelegate( this , config );
		}
	}
}
