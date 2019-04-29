package com.vidiun.commands.accessControl
{
	import com.vidiun.vo.VidiunAccessControl;
	import com.vidiun.delegates.accessControl.AccessControlAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class AccessControlAdd extends VidiunCall
	{
		public var filterFields : String;
		public function AccessControlAdd( accessControl : VidiunAccessControl )
		{
			service= 'accesscontrol';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(accessControl,'accessControl');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new AccessControlAddDelegate( this , config );
		}
	}
}
