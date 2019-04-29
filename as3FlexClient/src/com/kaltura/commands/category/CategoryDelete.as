package com.vidiun.commands.category
{
	import com.vidiun.delegates.category.CategoryDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class CategoryDelete extends VidiunCall
	{
		public var filterFields : String;
		public function CategoryDelete( id : int )
		{
			service= 'category';
			action= 'delete';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new CategoryDeleteDelegate( this , config );
		}
	}
}
