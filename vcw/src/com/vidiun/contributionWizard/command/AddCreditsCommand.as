/*
This file is part of the Vidiun Collaborative Media Suite which allows users 
to do with audio, video, and animation what Wiki platfroms allow them to do with 
text.

Copyright (C) 2006-2008  Vidiun Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

@ignore
*/
package com.vidiun.contributionWizard.command
{
	import com.adobe_cw.adobe.cairngorm.commands.ICommand;
	import com.adobe_cw.adobe.cairngorm.control.CairngormEvent;
	import com.vidiun.contributionWizard.events.CreditsEvent;
	import com.vidiun.contributionWizard.model.WizardModelLocator;

	public class AddCreditsCommand implements ICommand
	{

		private var _model:WizardModelLocator = WizardModelLocator.getInstance();
		public function execute(event:CairngormEvent):void
		{
			var evtAddCredit:CreditsEvent = event as CreditsEvent;
			_model.importData.creditsVo = evtAddCredit.creditsVo;
		}
		
	}
}