package com.vidiun.commands.EmailIngestionProfile
{
	import com.vidiun.vo.VidiunEmailIngestionProfile;
	import com.vidiun.delegates.EmailIngestionProfile.EmailIngestionProfileAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class EmailIngestionProfileAdd extends VidiunCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileAdd( EmailIP : VidiunEmailIngestionProfile )
		{
			service= 'emailingestionprofile';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(EmailIP,'EmailIP');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EmailIngestionProfileAddDelegate( this , config );
		}
	}
}
