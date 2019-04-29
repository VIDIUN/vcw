package com.vidiun.vo
{
	import com.vidiun.vo.VidiunSearchItem;

	[Bindable]
	public dynamic class VidiunSearchCondition extends VidiunSearchItem
	{
		public var field : String;
		public var value : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('field');
			propertyList.push('value');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('field');
			arr.push('value');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('field');
			arr.push('value');
			return arr;
		}

	}
}
