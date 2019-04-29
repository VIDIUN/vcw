package com.vidiun.vo
{
	import com.vidiun.vo.VidiunStorageJobData;

	[Bindable]
	public dynamic class VidiunStorageExportJobData extends VidiunStorageJobData
	{
		public var destFileSyncStoredPath : String;
		public var force : Boolean;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('destFileSyncStoredPath');
			propertyList.push('force');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('destFileSyncStoredPath');
			arr.push('force');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('destFileSyncStoredPath');
			arr.push('force');
			return arr;
		}

	}
}
