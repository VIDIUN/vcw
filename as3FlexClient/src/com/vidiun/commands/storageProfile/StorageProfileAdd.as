package com.vidiun.commands.storageProfile
{
	import com.vidiun.vo.VidiunStorageProfile;
	import com.vidiun.delegates.storageProfile.StorageProfileAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class StorageProfileAdd extends VidiunCall
	{
		public var filterFields : String;
		public function StorageProfileAdd( storageProfile : VidiunStorageProfile )
		{
			service= 'storageprofile_storageprofile';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(storageProfile,'storageProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StorageProfileAddDelegate( this , config );
		}
	}
}
