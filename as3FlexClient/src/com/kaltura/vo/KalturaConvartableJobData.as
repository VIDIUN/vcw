package com.vidiun.vo
{
	import com.vidiun.vo.VidiunFlavorParamsOutput;

	import com.vidiun.vo.VidiunJobData;

	[Bindable]
	public dynamic class VidiunConvartableJobData extends VidiunJobData
	{
		public var srcFileSyncLocalPath : String;
		public var actualSrcFileSyncLocalPath : String;
		public var srcFileSyncRemoteUrl : String;
		public var engineVersion : int = int.MIN_VALUE;
		public var flavorParamsOutputId : int = int.MIN_VALUE;
		public var flavorParamsOutput : VidiunFlavorParamsOutput;
		public var mediaInfoId : int = int.MIN_VALUE;
		public var currentOperationSet : int = int.MIN_VALUE;
		public var currentOperationIndex : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('srcFileSyncLocalPath');
			propertyList.push('actualSrcFileSyncLocalPath');
			propertyList.push('srcFileSyncRemoteUrl');
			propertyList.push('engineVersion');
			propertyList.push('flavorParamsOutputId');
			propertyList.push('flavorParamsOutput');
			propertyList.push('mediaInfoId');
			propertyList.push('currentOperationSet');
			propertyList.push('currentOperationIndex');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('srcFileSyncLocalPath');
			arr.push('actualSrcFileSyncLocalPath');
			arr.push('srcFileSyncRemoteUrl');
			arr.push('engineVersion');
			arr.push('flavorParamsOutputId');
			arr.push('flavorParamsOutput');
			arr.push('mediaInfoId');
			arr.push('currentOperationSet');
			arr.push('currentOperationIndex');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('srcFileSyncLocalPath');
			arr.push('actualSrcFileSyncLocalPath');
			arr.push('srcFileSyncRemoteUrl');
			arr.push('engineVersion');
			arr.push('flavorParamsOutputId');
			arr.push('flavorParamsOutput');
			arr.push('mediaInfoId');
			arr.push('currentOperationSet');
			arr.push('currentOperationIndex');
			return arr;
		}

	}
}
