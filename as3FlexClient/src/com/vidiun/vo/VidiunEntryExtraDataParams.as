package com.vidiun.vo
{
	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunEntryExtraDataParams extends BaseFlexVo
	{
		public var referrer : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('referrer');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('referrer');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('referrer');
			return arr;
		}

	}
}
