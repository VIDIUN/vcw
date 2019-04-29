package com.vidiun.vo
{
	import com.vidiun.vo.VidiunConvartableJobData;

	[Bindable]
	public dynamic class VidiunRemoteConvertJobData extends VidiunConvartableJobData
	{
		public var srcFileUrl : String;
		public var destFileUrl : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('srcFileUrl');
			propertyList.push('destFileUrl');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('srcFileUrl');
			arr.push('destFileUrl');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('srcFileUrl');
			arr.push('destFileUrl');
			return arr;
		}

	}
}
