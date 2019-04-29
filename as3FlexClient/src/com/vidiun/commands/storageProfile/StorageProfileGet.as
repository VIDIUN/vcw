package com.vidiun.commands.storageProfile
{
	import com.vidiun.delegates.storageProfile.StorageProfileGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class StorageProfileGet extends VidiunCall
	{
		public var filterFields : String;
		public function StorageProfileGet( storageProfileId : int )
		{
			service= 'storageprofile_storageprofile';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'storageProfileId' );
			valueArr.push( storageProfileId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StorageProfileGetDelegate( this , config );
		}
	}
}
