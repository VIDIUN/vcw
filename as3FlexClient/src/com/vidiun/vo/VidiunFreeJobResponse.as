package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBatchJob;

	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunFreeJobResponse extends BaseFlexVo
	{
		public var job : VidiunBatchJob;
		public var jobType : int = int.MIN_VALUE;
		public var queueSize : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('job');
			propertyList.push('jobType');
			propertyList.push('queueSize');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('job');
			arr.push('jobType');
			arr.push('queueSize');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			return arr;
		}

	}
}
