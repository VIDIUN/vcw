package com.vidiun.vo
{
	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunFilterPager extends BaseFlexVo
	{
		public var pageSize : int = int.MIN_VALUE;
		public var pageIndex : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('pageSize');
			propertyList.push('pageIndex');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('pageSize');
			arr.push('pageIndex');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('pageSize');
			arr.push('pageIndex');
			return arr;
		}

	}
}
