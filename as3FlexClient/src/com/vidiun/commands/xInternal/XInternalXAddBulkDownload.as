package com.vidiun.commands.xInternal
{
	import com.vidiun.delegates.xInternal.XInternalXAddBulkDownloadDelegate;
	import com.vidiun.net.VidiunCall;

	public class XInternalXAddBulkDownload extends VidiunCall
	{
		public var filterFields : String;
		public function XInternalXAddBulkDownload( entryIds : String,flavorParamsId : String='' )
		{
			service= 'xinternal';
			action= 'xAddBulkDownload';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryIds' );
			valueArr.push( entryIds );
			keyArr.push( 'flavorParamsId' );
			valueArr.push( flavorParamsId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new XInternalXAddBulkDownloadDelegate( this , config );
		}
	}
}
