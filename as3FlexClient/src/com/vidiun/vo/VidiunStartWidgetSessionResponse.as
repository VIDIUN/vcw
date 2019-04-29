package com.vidiun.vo
{
	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunStartWidgetSessionResponse extends BaseFlexVo
	{
		public var partnerId : int = int.MIN_VALUE;
		public var vs : String;
		public var userId : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('partnerId');
			propertyList.push('vs');
			propertyList.push('userId');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('partnerId');
			arr.push('vs');
			arr.push('userId');
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
