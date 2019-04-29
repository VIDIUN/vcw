package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBatchJobFilter;

	[Bindable]
	public dynamic class VidiunBatchJobFilterExt extends VidiunBatchJobFilter
	{
		public var jobTypeAndSubTypeIn : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('jobTypeAndSubTypeIn');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('jobTypeAndSubTypeIn');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('jobTypeAndSubTypeIn');
			return arr;
		}

	}
}
