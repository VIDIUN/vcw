package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBatchJobFilter;

	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunWorkerQueueFilter extends BaseFlexVo
	{
		public var schedulerId : int = int.MIN_VALUE;
		public var workerId : int = int.MIN_VALUE;
		public var jobType : int = int.MIN_VALUE;
		public var filter : VidiunBatchJobFilter;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('schedulerId');
			propertyList.push('workerId');
			propertyList.push('jobType');
			propertyList.push('filter');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('schedulerId');
			arr.push('workerId');
			arr.push('jobType');
			arr.push('filter');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('schedulerId');
			arr.push('workerId');
			arr.push('jobType');
			arr.push('filter');
			return arr;
		}

	}
}
