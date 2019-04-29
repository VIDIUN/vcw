package com.vidiun.commands.system
{
	import com.vidiun.delegates.system.SystemPingDelegate;
	import com.vidiun.net.VidiunCall;

	public class SystemPing extends VidiunCall
	{
		public var filterFields : String;
		public function SystemPing(  )
		{
			service= 'system';
			action= 'ping';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPingDelegate( this , config );
		}
	}
}
