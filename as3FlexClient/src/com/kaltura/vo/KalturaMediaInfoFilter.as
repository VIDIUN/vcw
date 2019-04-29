package com.vidiun.vo
{
	import com.vidiun.vo.VidiunFilter;

	[Bindable]
	public dynamic class VidiunMediaInfoFilter extends VidiunFilter
	{
		public var flavorAssetIdEqual : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('flavorAssetIdEqual');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('flavorAssetIdEqual');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('flavorAssetIdEqual');
			return arr;
		}

	}
}
