package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBaseRestriction;

	[Bindable]
	public dynamic class VidiunCountryRestriction extends VidiunBaseRestriction
	{
		public var countryRestrictionType : int = int.MIN_VALUE;
		public var countryList : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('countryRestrictionType');
			propertyList.push('countryList');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('countryRestrictionType');
			arr.push('countryList');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('countryRestrictionType');
			arr.push('countryList');
			return arr;
		}

	}
}
