package com.vidiun.commands.category
{
	import com.vidiun.vo.VidiunCategory;
	import com.vidiun.delegates.category.CategoryAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class CategoryAdd extends VidiunCall
	{
		public var filterFields : String;
		public function CategoryAdd( category : VidiunCategory )
		{
			service= 'category';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(category,'category');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new CategoryAddDelegate( this , config );
		}
	}
}
