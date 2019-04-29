package com.vidiun.contributionWizard.view.importViews
{
	import com.vidiun.contributionWizard.view.importViews.browser.NavigationButtonsMode;

	public interface IImportStep
	{
		function goNextStep():void;
		function goPrevStep():void;
		function get navigationButtonsMode():NavigationButtonsMode;
	}
}