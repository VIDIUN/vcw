package com.vidiun.contributionWizard.control
{
	import com.vidiun.contributionWizard.command.GetMediaInfoCommand;
	import com.vidiun.contributionWizard.command.LoginToProviderCommand;
	import com.vidiun.contributionWizard.command.ModerateSearchTermsCommand;
	import com.vidiun.contributionWizard.command.SearchMediaCommand;
	import com.vidiun.contributionWizard.command.ToggleAuthMethodCommand;
	import com.vidiun.contributionWizard.events.AuthMethodEvent;
	import com.vidiun.contributionWizard.events.LoginEvent;
	import com.vidiun.contributionWizard.events.MediaInfoEvent;
	import com.vidiun.contributionWizard.events.SearchMediaEvent;

	public class SimpleSearchController extends BaseSearchController
	{
		protected override function initializeCommands():void
		{
			super.initializeCommands()

			addCommand( AuthMethodEvent.TOGGLE_AUTH_METHOD,				ToggleAuthMethodCommand );
			addCommand( LoginEvent.PROVIDER_LOGIN, 						LoginToProviderCommand );
			addCommand( MediaInfoEvent.GET_MEDIA_INFO, 					GetMediaInfoCommand );
			addCommand( SearchMediaEvent.SEARCH_MEDIA, 					SearchMediaCommand );
		}
	}
}