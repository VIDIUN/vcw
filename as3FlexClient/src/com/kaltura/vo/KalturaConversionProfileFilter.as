package com.vidiun.vo
{
	import com.vidiun.vo.VidiunFilter;

	[Bindable]
	public dynamic class VidiunConversionProfileFilter extends VidiunFilter
	{
		public var idEqual : int = int.MIN_VALUE;
		public var idIn : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('idEqual');
			propertyList.push('idIn');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('idEqual');
			arr.push('idIn');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('idEqual');
			arr.push('idIn');
			return arr;
		}

	}
}
