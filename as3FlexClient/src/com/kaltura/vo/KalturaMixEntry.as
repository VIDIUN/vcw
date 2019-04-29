package com.vidiun.vo
{
	import com.vidiun.vo.VidiunPlayableEntry;

	[Bindable]
	public dynamic class VidiunMixEntry extends VidiunPlayableEntry
	{
		public var hasRealThumbnail : Boolean;
		public var editorType : int = int.MIN_VALUE;
		public var dataContent : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('hasRealThumbnail');
			propertyList.push('editorType');
			propertyList.push('dataContent');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('hasRealThumbnail');
			arr.push('editorType');
			arr.push('dataContent');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('editorType');
			arr.push('dataContent');
			return arr;
		}

	}
}
