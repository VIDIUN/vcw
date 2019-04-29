package com.vidiun.vo
{
	import com.vidiun.vo.VidiunSearchItem;

	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunFilter extends BaseFlexVo
	{
		public var orderBy : String;
		public var advancedSearch : VidiunSearchItem;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('orderBy');
			propertyList.push('advancedSearch');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('orderBy');
			arr.push('advancedSearch');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('orderBy');
			arr.push('advancedSearch');
			return arr;
		}

	}
}
