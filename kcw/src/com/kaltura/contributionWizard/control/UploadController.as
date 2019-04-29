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
	import com.vidiun.contributionWizard.command.AddFileCommand;
	import com.vidiun.contributionWizard.command.CancelUploadsCommand;
	import com.vidiun.contributionWizard.command.SkipCurrentUploadCommand;
	import com.vidiun.contributionWizard.command.UploadFilesCommand;
	import com.vidiun.contributionWizard.command.ValidateLimitationsCommand;
	import com.vidiun.contributionWizard.events.CancelUploadEvent;
	import com.vidiun.contributionWizard.events.FileReferenceEvent;
	import com.vidiun.contributionWizard.events.ValidateLimitationsEvent;
	

	public class UploadController extends ModuleFrontController
	{
		public function UploadController()
		{
			setupCommands();
		}
		
		private function setupCommands():void
		{
			
			addCommand( FileReferenceEvent.UPLOAD, 						UploadFilesCommand );
			addCommand( CancelUploadEvent.CANCEL_ALL_UPLOADS,			CancelUploadsCommand )
			addCommand( CancelUploadEvent.SKIP_CURRENT_UPLOAD,			SkipCurrentUploadCommand );
			addCommand( FileReferenceEvent.FILES_ADD, 					AddFileCommand );
			//addCommand( ValidateLimitationsEvent.VALIDATE,				ValidateLimitationsCommand);
		}
	}
}