package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBaseRestriction;

	[Bindable]
	public dynamic class VidiunSiteRestriction extends VidiunBaseRestriction
	{
		public var siteRestrictionType : int = int.MIN_VALUE;
		public var siteList : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('siteRestrictionType');
			propertyList.push('siteList');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('siteRestrictionType');
			arr.push('siteList');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('siteRestrictionType');
			arr.push('siteList');
			return arr;
		}

	}
}
