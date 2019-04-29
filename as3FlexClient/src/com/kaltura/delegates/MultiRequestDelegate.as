package com.vidiun.delegates
{
	import com.vidiun.commands.MultiRequest;
	import com.vidiun.config.VidiunConfig;
	import com.vidiun.errors.VidiunError;

	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class MultiRequestDelegate extends WebDelegateBase
	{
		public function MultiRequestDelegate(call:MultiRequest, config:VidiunConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			var resArr : Array = new Array();
			for ( var i:int=0; i<(call as MultiRequest).actions.length; i++ )
			{
				var callClassName : String = getQualifiedClassName( (call as MultiRequest).actions[i] );
				var commandName : String = callClassName.split("::")[1];
				var packageArr : Array =  (callClassName.split("::")[0]).split(".");
				var importFrom : String = packageArr[packageArr.length-1];

				var clsName : String = "com.vidiun.delegates."+importFrom+"."+ commandName +"Delegate"; //'com.vidiun.delegates.session.SessionStartDelegate'
				var cls : Class = getDefinitionByName( clsName ) as Class;//(') as Class;

				var myInst : Object = new cls(null , null);

				//build the result as a regular result
				var xml : String = "<result><result>";
				xml += result.result.item[i].children().toString();
				xml +="</result></result>";
				var res : XML = new XML(xml);
				try {
					var obj : Object = (myInst as WebDelegateBase).parse( res );
					resArr.push( obj );
				} catch (e:Error) {
					var vErr : VidiunError = new VidiunError();
					vErr.errorCode = String(e.errorID);
					vErr.errorMsg = e.message;
					resArr.push( vErr );
				}
			}

			return resArr;
		}
	}
}