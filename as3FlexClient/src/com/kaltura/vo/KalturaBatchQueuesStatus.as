package com.vidiun.vo
{
	import com.vidiun.vo.BaseFlexVo;
	public dynamic class VidiunBatchQueuesStatus extends BaseFlexVo
	{
		public var jobType : int = int.MIN_VALUE;
		public var size : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('jobType');
			propertyList.push('size');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('jobType');
			arr.push('size');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('jobType');
			arr.push('size');
			return arr;
		}

	}
}
