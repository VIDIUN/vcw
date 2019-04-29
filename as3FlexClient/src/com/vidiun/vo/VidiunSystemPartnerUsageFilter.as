package com.vidiun.vo
{
	import com.vidiun.vo.VidiunFilter;

	[Bindable]
	public dynamic class VidiunSystemPartnerUsageFilter extends VidiunFilter
	{
		public var fromDate : int = int.MIN_VALUE;
		public var toDate : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('fromDate');
			propertyList.push('toDate');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('fromDate');
			arr.push('toDate');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('fromDate');
			arr.push('toDate');
			return arr;
		}

	}
}
