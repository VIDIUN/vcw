package com.vidiun.vo
{
	import com.vidiun.vo.VidiunSearchOperator;

	[Bindable]
	public dynamic class VidiunMetadataSearchItem extends VidiunSearchOperator
	{
		public var metadataProfileId : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('metadataProfileId');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('metadataProfileId');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('metadataProfileId');
			return arr;
		}

	}
}
