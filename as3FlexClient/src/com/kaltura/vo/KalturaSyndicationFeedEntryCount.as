package com.vidiun.vo
{
	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunSyndicationFeedEntryCount extends BaseFlexVo
	{
		public var totalEntryCount : int = int.MIN_VALUE;
		public var actualEntryCount : int = int.MIN_VALUE;
		public var requireTranscodingCount : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('totalEntryCount');
			propertyList.push('actualEntryCount');
			propertyList.push('requireTranscodingCount');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('totalEntryCount');
			arr.push('actualEntryCount');
			arr.push('requireTranscodingCount');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('totalEntryCount');
			arr.push('actualEntryCount');
			arr.push('requireTranscodingCount');
			return arr;
		}

	}
}
