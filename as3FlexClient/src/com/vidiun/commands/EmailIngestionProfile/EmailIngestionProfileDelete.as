package com.vidiun.commands.EmailIngestionProfile
{
	import com.vidiun.delegates.EmailIngestionProfile.EmailIngestionProfileDeleteDelegate;
	import com.vidiun.net.VidiunCall;

	public class EmailIngestionProfileDelete extends VidiunCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileDelete( id : int )
		{
			service= 'emailingestionprofile';
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
			delegate = new EmailIngestionProfileDeleteDelegate( this , config );
		}
	}
}
