package com.vidiun.commands.storageProfile
{
	import com.vidiun.vo.VidiunStorageProfile;
	import com.vidiun.delegates.storageProfile.StorageProfileUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class StorageProfileUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function StorageProfileUpdate( storageProfileId : int,storageProfile : VidiunStorageProfile )
		{
			service= 'storageprofile_storageprofile';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'storageProfileId' );
			valueArr.push( storageProfileId );
 			keyValArr = vidiunObject2Arrays(storageProfile,'storageProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new StorageProfileUpdateDelegate( this , config );
		}
	}
}
