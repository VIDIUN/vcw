package com.vidiun.delegates.baseEntry
{
	import com.vidiun.vo.VidiunBaseEntry;VidiunBaseEntry;;

	import com.vidiun.core.VClassFactory;

	import flash.utils.getDefinitionByName;
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.net.VidiunCall;
	import com.vidiun.delegates.WebDelegateBase;
	public class BaseEntryGetByIdsDelegate extends WebDelegateBase
	{
		public function BaseEntryGetByIdsDelegate(call:VidiunCall, config:VidiunConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			var arr : Array = new Array();
			for( var i:int=0; i<result.result.children().length() ; i++)
			{
				var cls : Class = getDefinitionByName('com.vidiun.vo.'+ result.result.children()[i].objectType) as Class;
				var obj : * = (new VClassFactory( cls )).newInstanceFromXML( XMLList(result.result.children()[i]) );
				arr.push(obj);
			}
			return arr;
		}

	}
}
