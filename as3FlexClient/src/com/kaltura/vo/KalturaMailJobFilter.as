package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBaseJobFilter;

	[Bindable]
	public dynamic class VidiunMailJobFilter extends VidiunBaseJobFilter
	{
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
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
