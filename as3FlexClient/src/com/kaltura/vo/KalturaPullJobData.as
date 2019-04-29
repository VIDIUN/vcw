package com.vidiun.vo
{
	import com.vidiun.vo.VidiunJobData;

	[Bindable]
	public dynamic class VidiunPullJobData extends VidiunJobData
	{
		public var srcFileUrl : String;
		public var destFileLocalPath : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('srcFileUrl');
			propertyList.push('destFileLocalPath');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('srcFileUrl');
			arr.push('destFileLocalPath');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('srcFileUrl');
			arr.push('destFileLocalPath');
			return arr;
		}

	}
}
