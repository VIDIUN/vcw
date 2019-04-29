package com.vidiun.vo
{
	import com.vidiun.vo.VidiunMediaEntryFilter;

	[Bindable]
	public dynamic class VidiunMediaEntryFilterForPlaylist extends VidiunMediaEntryFilter
	{
		public var limit : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('limit');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('limit');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('limit');
			return arr;
		}

	}
}
