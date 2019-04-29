package com.vidiun.vo
{
	import com.vidiun.vo.VidiunJobData;

	[Bindable]
	public dynamic class VidiunStorageJobData extends VidiunJobData
	{
		public var serverUrl : String;
		public var serverUsername : String;
		public var serverPassword : String;
		public var ftpPassiveMode : Boolean;
		public var srcFileSyncLocalPath : String;
		public var srcFileSyncId : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('serverUrl');
			propertyList.push('serverUsername');
			propertyList.push('serverPassword');
			propertyList.push('ftpPassiveMode');
			propertyList.push('srcFileSyncLocalPath');
			propertyList.push('srcFileSyncId');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('serverUrl');
			arr.push('serverUsername');
			arr.push('serverPassword');
			arr.push('ftpPassiveMode');
			arr.push('srcFileSyncLocalPath');
			arr.push('srcFileSyncId');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('serverUrl');
			arr.push('serverUsername');
			arr.push('serverPassword');
			arr.push('ftpPassiveMode');
			arr.push('srcFileSyncLocalPath');
			arr.push('srcFileSyncId');
			return arr;
		}

	}
}
