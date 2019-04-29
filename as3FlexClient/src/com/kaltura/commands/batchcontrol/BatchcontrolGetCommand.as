package com.vidiun.commands.batchcontrol
{
	import com.vidiun.delegates.batchcontrol.BatchcontrolGetCommandDelegate;
	import com.vidiun.net.VidiunCall;

	public class BatchcontrolGetCommand extends VidiunCall
	{
		public var filterFields : String;
		public function BatchcontrolGetCommand( commandId : int )
		{
			service= 'batchcontrol';
			action= 'getCommand';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'commandId' );
			valueArr.push( commandId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BatchcontrolGetCommandDelegate( this , config );
		}
	}
}
