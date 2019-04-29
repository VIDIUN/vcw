package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBaseEntry;

	[Bindable]
	public dynamic class VidiunDocumentEntry extends VidiunBaseEntry
	{
		public var documentType : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('documentType');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('documentType');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			return arr;
		}

	}
}
