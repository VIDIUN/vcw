package com.vidiun.vo
{
	import com.vidiun.vo.VidiunStorageJobData;

	[Bindable]
	public dynamic class VidiunStorageDeleteJobData extends VidiunStorageJobData
	{
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			return arr;
		}

	}
}
