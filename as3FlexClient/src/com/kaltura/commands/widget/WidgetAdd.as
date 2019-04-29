package com.vidiun.commands.widget
{
	import com.vidiun.vo.VidiunWidget;
	import com.vidiun.delegates.widget.WidgetAddDelegate;
	import com.vidiun.net.VidiunCall;

	public class WidgetAdd extends VidiunCall
	{
		public var filterFields : String;
		public function WidgetAdd( widget : VidiunWidget )
		{
			service= 'widget';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = vidiunObject2Arrays(widget,'widget');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new WidgetAddDelegate( this , config );
		}
	}
}
