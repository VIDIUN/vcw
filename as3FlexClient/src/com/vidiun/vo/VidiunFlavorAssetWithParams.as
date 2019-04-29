package com.vidiun.vo
{
	import com.vidiun.vo.VidiunFlavorParams;

	import com.vidiun.vo.VidiunFlavorAsset;

	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunFlavorAssetWithParams extends BaseFlexVo
	{
		public var flavorAsset : VidiunFlavorAsset;
		public var flavorParams : VidiunFlavorParams;
		public var entryId : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('flavorAsset');
			propertyList.push('flavorParams');
			propertyList.push('entryId');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('flavorAsset');
			arr.push('flavorParams');
			arr.push('entryId');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('flavorAsset');
			arr.push('flavorParams');
			arr.push('entryId');
			return arr;
		}

	}
}
