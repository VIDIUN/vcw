package com.vidiun.commands.search
{
	import com.vidiun.delegates.search.SearchExternalLoginDelegate;
	import com.vidiun.net.VidiunCall;

	public class SearchExternalLogin extends VidiunCall
	{
		public var filterFields : String;
		public function SearchExternalLogin( searchSource : int,userName : String,password : String )
		{
			service= 'search';
			action= 'externalLogin';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'searchSource' );
			valueArr.push( searchSource );
			keyArr.push( 'userName' );
			valueArr.push( userName );
			keyArr.push( 'password' );
			valueArr.push( password );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SearchExternalLoginDelegate( this , config );
		}
	}
}
