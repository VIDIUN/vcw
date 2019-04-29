package com.vidiun.vo
{
	import com.vidiun.vo.VidiunBaseSyndicationFeed;

	[Bindable]
	public dynamic class VidiunTubeMogulSyndicationFeed extends VidiunBaseSyndicationFeed
	{
		public var category : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('category');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('category');
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
