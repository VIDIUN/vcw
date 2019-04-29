package com.vidiun.commands.EmailIngestionProfile
{
	import com.vidiun.delegates.EmailIngestionProfile.EmailIngestionProfileGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class EmailIngestionProfileGet extends VidiunCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileGet( id : int )
		{
			service= 'emailingestionprofile';
			action= 'get';

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
			delegate = new EmailIngestionProfileGetDelegate( this , config );
		}
	}
}
