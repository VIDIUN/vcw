package com.vidiun.commands.EmailIngestionProfile
{
	import com.vidiun.vo.VidiunEmailIngestionProfile;
	import com.vidiun.delegates.EmailIngestionProfile.EmailIngestionProfileUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class EmailIngestionProfileUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileUpdate( id : int,EmailIP : VidiunEmailIngestionProfile )
		{
			service= 'emailingestionprofile';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(EmailIP,'EmailIP');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EmailIngestionProfileUpdateDelegate( this , config );
		}
	}
}
