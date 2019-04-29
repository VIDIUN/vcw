package com.vidiun.contributionWizard.command
{
	import com.adobe_cw.adobe.cairngorm.control.CairngormEvent;
	import com.arc90.modular.ModuleSequenceCommand;
	import com.vidiun.contributionWizard.events.ChangePermissionLevelEvent;
	import com.vidiun.contributionWizard.model.WizardModelLocator;

	public class ChangePermissionLevelCommand extends ModuleSequenceCommand
	{
		private var _model:WizardModelLocator = WizardModelLocator.getInstance();

		override public function execute(event:CairngormEvent):void
		{
			var permissionsEvent:ChangePermissionLevelEvent = event as ChangePermissionLevelEvent;
			_model.context.permissions = permissionsEvent.permissionLevel;
		}
	}
}