package com.vidiun.commands.media
{
	import com.vidiun.delegates.media.MediaRequestConversionDelegate;
	import com.vidiun.net.VidiunCall;

	public class MediaRequestConversion extends VidiunCall
	{
		public var filterFields : String;
		public function MediaRequestConversion( entryId : String,fileFormat : String )
		{
			service= 'media';
			action= 'requestConversion';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'fileFormat' );
			valueArr.push( fileFormat );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaRequestConversionDelegate( this , config );
		}
	}
}
