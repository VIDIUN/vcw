package com.vidiun.commands.partner
{
	import com.vidiun.delegates.partner.PartnerGetUsageDelegate;
	import com.vidiun.net.VidiunCall;

	public class PartnerGetUsage extends VidiunCall
	{
		public var filterFields : String;
		public function PartnerGetUsage( year : int=undefined,month : int=1,resolution : String='days' )
		{
			service= 'partner';
			action= 'getUsage';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'year' );
			valueArr.push( year );
			keyArr.push( 'month' );
			valueArr.push( month );
			keyArr.push( 'resolution' );
			valueArr.push( resolution );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PartnerGetUsageDelegate( this , config );
		}
	}
}
