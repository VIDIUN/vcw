package com.vidiun.commands.fileSync
{
	import com.vidiun.vo.File;
	import com.vidiun.delegates.fileSync.FileSyncSyncDelegate;
	import com.vidiun.net.VidiunCall;

	public class FileSyncSync extends VidiunCall
	{
		public var filterFields : String;
		public function FileSyncSync( fileSyncId : int,fileData : file )
		{
			service= 'filesync_filesync';
			action= 'sync';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'fileSyncId' );
			valueArr.push( fileSyncId );
 			keyValArr = vidiunObject2Arrays(fileData,'fileData');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FileSyncSyncDelegate( this , config );
		}
	}
}
