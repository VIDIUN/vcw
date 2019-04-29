package com.vidiun.vo
{
	import com.vidiun.vo.VidiunSearchItem;

	[Bindable]
	public dynamic class VidiunSearchOperator extends VidiunSearchItem
	{
		public var type : int = int.MIN_VALUE;
		public var items : Array = new Array();
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('type');
			propertyList.push('items');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('type');
			arr.push('items');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('type');
			arr.push('items');
			return arr;
		}

	}
}
