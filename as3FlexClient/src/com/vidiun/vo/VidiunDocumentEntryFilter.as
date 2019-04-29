package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBaseEntryFilter;

	[Bindable]
	public dynamic class VidiunDocumentEntryFilter extends VidiunBaseEntryFilter
	{
		public var documentTypeEqual : int = int.MIN_VALUE;
		public var documentTypeIn : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('documentTypeEqual');
			propertyList.push('documentTypeIn');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('documentTypeEqual');
			arr.push('documentTypeIn');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('documentTypeEqual');
			arr.push('documentTypeIn');
			return arr;
		}

	}
}
