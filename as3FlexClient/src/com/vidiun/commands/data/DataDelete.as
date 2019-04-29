package com.vidiun.commands.data
{
	import com.vidiun.delegates.data.DataDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class DataDelete extends VidiunCall
	{
		public var filterFields : String;
		public function DataDelete( entryId : String )
		{
			service= 'data';
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
			delegate = new DataDeleteDelegate( this , config );
		}
	}
}
