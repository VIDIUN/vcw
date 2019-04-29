package com.vidiun.commands.category
{
	import com.vidiun.vo.VidiunCategoryFilter;
	import com.vidiun.delegates.category.CategoryListDelegate;
	import com.vidiun.net.VidiunCall;

	public class CategoryList extends VidiunCall
	{
		public var filterFields : String;
		public function CategoryList( filter : VidiunCategoryFilter=null )
		{
			if(filter== null)filter= new VidiunCategoryFilter();
			service= 'category';
			action= 'list';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new CategoryListDelegate( this , config );
		}
	}
}
