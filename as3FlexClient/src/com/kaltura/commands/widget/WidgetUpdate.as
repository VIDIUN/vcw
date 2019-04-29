package com.vidiun.commands.widget
{
	import com.vidiun.vo.VidiunWidget;
	import com.vidiun.delegates.widget.WidgetUpdateDelegate;
	import com.vidiun.net.VidiunCall;

	public class WidgetUpdate extends VidiunCall
	{
		public var filterFields : String;
		public function WidgetUpdate( id : String,widget : VidiunWidget )
		{
			service= 'widget';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = vidiunObject2Arrays(widget,'widget');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new WidgetUpdateDelegate( this , config );
		}
	}
}
