package com.vidiun.vo
{
	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunTransformMetadataResponse extends BaseFlexVo
	{
		public var objects : Array = new Array();
		public var totalCount : int = int.MIN_VALUE;
		public var lowerVersionCount : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('objects');
			propertyList.push('totalCount');
			propertyList.push('lowerVersionCount');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('objects');
			arr.push('totalCount');
			arr.push('lowerVersionCount');
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
