package com.vidiun.contributionWizard.command
{
	import com.adobe_cw.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe_cw.adobe.cairngorm.control.CairngormEvent;
	import com.bjorn.event.ChainEvent;
	import com.vidiun.contributionWizard.events.LoadUIEvent;
	import com.vidiun.contributionWizard.model.WizardModelLocator;
	import com.vidiun.contributionWizard.vo.UIConfigVO;

	import flash.events.IEventDispatcher;
	import flash.system.ApplicationDomain;

	import mx.events.ResourceEvent;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	public class LoadLocaleCommand extends SequenceCommand
	{
		private var _resourceManager:IResourceManager = ResourceManager.getInstance();
		private var _resourceLoader:IEventDispatcher;

		private var _model:WizardModelLocator = WizardModelLocator.getInstance();

		public override function execute(event:CairngormEvent):void
		{
			nextEvent = ChainEvent(event).nextChainedEvent;

			var loadUiEvent:LoadUIEvent = event as LoadUIEvent;
			var uiConfigVo:UIConfigVO = loadUiEvent.uiConfigVo;
			var appDomain:ApplicationDomain;

			if (uiConfigVo && uiConfigVo.localeUrl)
			{
				appDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
				
				var localeUrl : String = uiConfigVo.localeUrl;
				
				//if we want to test the vcw in file system mode
				if(_model.context.fileSystemMode) 
				{
					localeUrl = "assets/en_US_ContributionWizard_vidiun.swf";
					if(_model.context.localLocale)
						localeUrl = _model.context.localLocale;
				}
					
				_resourceLoader = _resourceManager.loadResourceModule(localeUrl, true, appDomain);
				_resourceLoader.addEventListener(ResourceEvent.COMPLETE , resourceCompleteHandler);
				_resourceLoader.addEventListener(ResourceEvent.ERROR , resourceErrorHandler);
			}
			else
			{
				executeNextCommand();
				_model.loadState.loaded();
			}
		}

		private function resourceCompleteHandler(resourceComplete:ResourceEvent):void
		{
			//the first locale, assuming that locale cannot be changed after it's set
			//This might be buggy if associative array keys order isn't consistent.
			var localesList:Array = ResourceManager.getInstance().getLocales();
			var orderedLocales:Array = ["en_US"];
			localesList.forEach
			(
				function(element:String, index:int, list:Array):void
				{
					if (element.indexOf("vidiun") == -1)
					{
						orderedLocales.unshift(element);
					}
					else
					{
						orderedLocales.push(element);
					}
				}
			);
			_resourceManager.localeChain = orderedLocales;
			//_resourceManager.localeChain = ResourceManager.getInstance().getLocales().reverse();//["en_US_vidiun", "en_US"] => ["en_US", "en_US_vidiun"];
			_model.loadState.loaded();
		}

		private function resourceErrorHandler(resourceError:ResourceEvent):void
		{
			trace("resourceErrorHandler()");
		}

	}
}