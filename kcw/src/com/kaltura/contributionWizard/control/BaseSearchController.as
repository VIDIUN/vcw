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
package com.vidiun.contributionWizard.control
{
	import com.arc90.modular.ModuleFrontController;
	import com.vidiun.contributionWizard.command.ModerateSearchTermsCommand;
	import com.vidiun.contributionWizard.command.PlaySoundCommand;
	import com.vidiun.contributionWizard.command.SetSearchTermsCommand;
	import com.vidiun.contributionWizard.command.StopSoundCommand;
	import com.vidiun.contributionWizard.events.SearchMediaEvent;
	import com.vidiun.contributionWizard.events.SoundToggleEvent;

	public class BaseSearchController extends ModuleFrontController
	{
		public function BaseSearchController():void
		{
			initializeCommands();
		}

		protected function initializeCommands() : void
		{

			addCommand( SearchMediaEvent.SET_SEARCH_TERMS, 				SetSearchTermsCommand );
			addCommand( SoundToggleEvent.PLAY_SOUND,  					PlaySoundCommand );
			addCommand( SoundToggleEvent.STOP_SOUND,					StopSoundCommand );
			addCommand( SearchMediaEvent.MODERATE_SEARCH_TERMS,			ModerateSearchTermsCommand );

		}
	}
}