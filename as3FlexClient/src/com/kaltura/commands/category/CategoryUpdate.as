package com.vidiun.commands.category
{
	import com.vidiun.vo.VidiunCategory;
	import com.vidiun.delegates.category.CategoryUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class CategoryUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function CategoryUpdate( id : int,category : VidiunCategory )
		{
			service= 'category';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(category,'category');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new CategoryUpdateDelegate( this , config );
		}
	}
}
