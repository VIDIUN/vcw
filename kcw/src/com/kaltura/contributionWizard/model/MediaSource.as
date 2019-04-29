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
package com.vidiun.contributionWizard.model
{
	[Bindable]
	public class MediaSource
	{
		/**
		 * The code is the corresponding type integer that is used by the server
		 * 
		 */		
		public function get mediaCode():int
		{
			return _mediaCode;
		}
		public function set mediaType(name:String):void
		{
			_mediaType = name;
			setMediaCode();
		}
		public function get mediaType():String
		{
			return _mediaType;
		}
		
		private var _mediaType:String;
		private var _mediaCode:int;

		public function setMediaCode():void
		{
		
			switch (_mediaType)
			{
				case MediaTypes.AUDIO:
					_mediaCode = 5;
				break;
				
				case MediaTypes.VIDEO:
					_mediaCode = 1
				break;
				
				case MediaTypes.IMAGE:
				case MediaTypes.DRAWING:
					_mediaCode = 2;
				break
				
				case MediaTypes.SWF:
					_mediaCode = 12;
				break;
				
				default:
					trace("Error: No such media type. can't create corresponding media code");
				break;
			}
	}
}