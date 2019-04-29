package com.vidiun.vo
{
	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunPartnerListResponse extends BaseFlexVo
	{
		public var objects : Array = new Array();
		public var totalCount : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('objects');
			propertyList.push('totalCount');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('objects');
			arr.push('totalCount');
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
