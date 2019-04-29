package com.vidiun.vo
{
	import com.vidiun.vo.BaseFlexVo;
	[Bindable]
	public dynamic class VidiunBulkUploadPluginData extends BaseFlexVo
	{
		public var field : String;
		public var value : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('field');
			propertyList.push('value');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('field');
			arr.push('value');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('field');
			arr.push('value');
			return arr;
		}

	}
}
