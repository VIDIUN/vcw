package com.vidiun.commands.notification
{
	import com.vidiun.delegates.notification.NotificationGetClientNotificationDelegate;
	import com.vidiun.net.VidiunCall;

	public class NotificationGetClientNotification extends VidiunCall
	{
		public var filterFields : String;
		public function NotificationGetClientNotification( entryId : String,type : int )
		{
			service= 'notification';
			action= 'getClientNotification';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'type' );
			valueArr.push( type );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new NotificationGetClientNotificationDelegate( this , config );
		}
	}
}
