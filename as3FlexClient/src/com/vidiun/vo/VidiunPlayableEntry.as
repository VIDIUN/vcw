package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBaseEntry;

	[Bindable]
	public dynamic class VidiunPlayableEntry extends VidiunBaseEntry
	{
		public var plays : int = int.MIN_VALUE;
		public var views : int = int.MIN_VALUE;
		public var width : int = int.MIN_VALUE;
		public var height : int = int.MIN_VALUE;
		public var duration : int = int.MIN_VALUE;
		public var msDuration : int = int.MIN_VALUE;
		public var durationType : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('plays');
			propertyList.push('views');
			propertyList.push('width');
			propertyList.push('height');
			propertyList.push('duration');
			propertyList.push('msDuration');
			propertyList.push('durationType');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('plays');
			arr.push('views');
			arr.push('width');
			arr.push('height');
			arr.push('duration');
			arr.push('msDuration');
			arr.push('durationType');
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
