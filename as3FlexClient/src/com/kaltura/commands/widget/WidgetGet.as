package com.vidiun.commands.widget
{
	import com.vidiun.delegates.widget.WidgetGetDelegate;
	import com.vidiun.net.VidiunCall;

	public class WidgetGet extends VidiunCall
	{
		public var filterFields : String;
		public function WidgetGet( id : String )
		{
			service= 'widget';
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
			delegate = new WidgetGetDelegate( this , config );
		}
	}
}
