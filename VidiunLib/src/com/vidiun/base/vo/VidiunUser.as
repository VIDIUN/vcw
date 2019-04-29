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
package com.vidiun.base.vo
{
	import flash.events.EventDispatcher;

	/**
	 *the details of the user as described by the vidiun server.
	 */
	public class VidiunUser extends EventDispatcher
	{
		//the details of the user in vidiun server.
		public var vuserId:uint;
		public var screenName:String;
		public var partnerId:uint;
		public var puserId:uint;
		public var fullName:String;
		public var email:String;
		public var dateOfBirth:String;
		public var pictureUrl:String;
		public var aboutMe:String;
		public var tags:String;
		public var gender:int; //0=undefined, 1=male, 2=female
		public var registerationDate:Date;

		public function VidiunUser (userXml:XML):void
		{
			if (!userXml)
				return;
			vuserId = uint (userXml.id);
			screenName = userXml.screenName;
			partnerId = uint (userXml.partnerId);
			puserId = uint (userXml.puserId);
			fullName = userXml.fullName;
			email = userXml.email;
			dateOfBirth = userXml.dateOfBirth;
			pictureUrl = userXml.pictureUrl;
			aboutMe = userXml.aboutMe;
			tags = userXml.tags;
			gender = int (userXml.gender)
			registerationDate = new Date (uint(userXml.createdAtAsInt));
		}
	}
}