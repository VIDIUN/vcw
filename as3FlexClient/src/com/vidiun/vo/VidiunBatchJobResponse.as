package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBatchJob;

	import com.vidiun.vo.BaseFlexVo;
	public dynamic class VidiunBatchJobResponse extends BaseFlexVo
	{
		public var batchJob : VidiunBatchJob;
		public var childBatchJobs : Array = new Array();
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('batchJob');
			propertyList.push('childBatchJobs');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('batchJob');
			arr.push('childBatchJobs');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('batchJob');
			arr.push('childBatchJobs');
			return arr;
		}

	}
}
