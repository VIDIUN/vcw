package com.vidiun.vo
{
	import com.vidiun.vo.VidiunCropDimensions;

	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunConversionProfile extends BaseFlexVo
	{
		public var id : int = int.MIN_VALUE;
		public var partnerId : int = int.MIN_VALUE;
		public var name : String;
		public var description : String;
		public var createdAt : int = int.MIN_VALUE;
		public var flavorParamsIds : String;
		public var isDefault : int = int.MIN_VALUE;
		public var cropDimensions : VidiunCropDimensions;
		public var clipStart : int = int.MIN_VALUE;
		public var clipDuration : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('id');
			propertyList.push('partnerId');
			propertyList.push('name');
			propertyList.push('description');
			propertyList.push('createdAt');
			propertyList.push('flavorParamsIds');
			propertyList.push('isDefault');
			propertyList.push('cropDimensions');
			propertyList.push('clipStart');
			propertyList.push('clipDuration');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('id');
			arr.push('partnerId');
			arr.push('name');
			arr.push('description');
			arr.push('createdAt');
			arr.push('flavorParamsIds');
			arr.push('isDefault');
			arr.push('cropDimensions');
			arr.push('clipStart');
			arr.push('clipDuration');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('name');
			arr.push('description');
			arr.push('flavorParamsIds');
			arr.push('isDefault');
			arr.push('cropDimensions');
			arr.push('clipStart');
			arr.push('clipDuration');
			return arr;
		}

	}
}
