package com.vidiun.commands.EmailIngestionProfile
{
	import com.vidiun.vo.VidiunMediaEntry;
	import com.vidiun.delegates.EmailIngestionProfile.EmailIngestionProfileAddMediaEntryDelegate;
	import com.vidiun.net.VidiunCall;

	public class EmailIngestionProfileAddMediaEntry extends VidiunCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileAddMediaEntry( mediaEntry : VidiunMediaEntry,uploadTokenId : String,emailProfId : int,fromAddress : String,emailMsgId : String )
		{
			service= 'emailingestionprofile';
			action= 'addMediaEntry';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'uploadTokenId' );
			valueArr.push( uploadTokenId );
			keyArr.push( 'emailProfId' );
			valueArr.push( emailProfId );
			keyArr.push( 'fromAddress' );
			valueArr.push( fromAddress );
			keyArr.push( 'emailMsgId' );
			valueArr.push( emailMsgId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EmailIngestionProfileAddMediaEntryDelegate( this , config );
		}
	}
}
