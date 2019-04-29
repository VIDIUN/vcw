package com.vidiun.analytics
{
//	import com.adobe.crypto.MD5;
	import com.vidiun.VidiunClient;
	import com.vidiun.commands.stats.StatsCollect;
	import com.vidiun.commands.stats.StatsVmcCollect;
	import com.vidiun.vo.VidiunStatsVmcEvent;
	
	import flash.net.URLRequestMethod;
	
	public class VAnalyticsTracker
	{
		private static var _instance:VAnalyticsTracker;
		private var _kc:VidiunClient;
	//	private var _sessionId:String;   - No need for it, the server will use the VS of the user.
		private var _clientVersion:String;
		private var _swfName:String;
		private var _userId:String;
		
		public function VAnalyticsTracker(enforcer:Enforcer){}
		
		public static function getInstance():VAnalyticsTracker
		{
			if(_instance == null)
			{
				_instance = new VAnalyticsTracker(new Enforcer());
			}
			
			return _instance;
		}
        
        public function init(kc:VidiunClient, swfName:String, clientVersion:String, userId:String):void
        {
        	_kc = kc;
 //       	_sessionId = MD5.hash(_kc.vs);
        	_clientVersion = clientVersion;
        	_userId = userId;
        	_swfName = swfName;
        }
        
        public function sendEvent(eventCode:int, eventPath:String, entryId:String=null, uiconfId:int=int.MIN_VALUE, widgetId:String=null):void
        {
        	var analyticsEvent:VidiunStatsVmcEvent = new VidiunStatsVmcEvent();
        	analyticsEvent.vmcEventType = eventCode;
        	analyticsEvent.vmcEventActionPath = eventPath;
//        	analyticsEvent.sessionId = _sessionId;
        	analyticsEvent.partnerId = int(_kc.partnerId);
        	analyticsEvent.clientVer = "1.0:" + _swfName + ":" + _clientVersion;
        	analyticsEvent.userId = _userId;
        	analyticsEvent.eventTimestamp = (new Date().time)/1000;
        	analyticsEvent.uiconfId = uiconfId; // when manipulating uiconfs
        	analyticsEvent.entryId = entryId;  // when manipulating entries
 //       	analyticsEvent.userIp  - server side, no need to send
        	analyticsEvent.widgetId = widgetId;// when manipulating widgets (relevant for the embed code)
        	
        	
        	var statsVmcCall:StatsVmcCollect = new StatsVmcCollect(analyticsEvent);
        	statsVmcCall.method = URLRequestMethod.GET;
        	_kc.post(statsVmcCall);
        }
        
       
	}
}
	
class Enforcer
{

}