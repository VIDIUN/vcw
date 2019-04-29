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
package com.vidiun.vo
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	import mx.core.IUID;
	import mx.utils.UIDUtil;

	/**
	 * This class represents metaData on media. 
	 * @author Michal
	 * 
	 */
	[Bindable]
	public class MediaMetaDataVO implements IValueObject, IUID
	{

		public function MediaMetaDataVO (title:String = null, tags:String = null, category:String = null,description:String = null, partnerData:String = null):void
		{
			this.title = title;
			this.tags = tags;
			this.description = description;
			this.category = category;
			this.uid = UIDUtil.createUID();
		}
		
		public var title:String;
		public var titleErrorString:String = "";

		public var tags:String;
		public var tagsErrorString:String = "";

		public var description:String;
		
		public var category:String;

		public var partnerData:String;
		
		//the title user inserted in tagging view
		public var insertedTitle:String = "";
		
	    public function get uid():String
	    {
	    	return _uid;
	    }
	    public function set uid(value:String):void
	    {
	    	_uid = value;
	    }
		private var _uid:String;

		/**
		 * Merges this MediaMetaData object with a given MediaMetaData object.
		 * This function takes the given sourceMetaData parameter and copies its non-empty fields to this object
		 * @param sourceMetaData
		 *
		 */
		public function mergeWith(sourceMetaData:MediaMetaDataVO):void
		{
			if (sourceMetaData.tags != null)
				this.tags = sourceMetaData.tags;

			if (sourceMetaData.title != null)
				this.title = sourceMetaData.title;

			if (sourceMetaData.description != null)
				this.description = sourceMetaData.description;
				
			if (sourceMetaData.category != null) 
				this.category = sourceMetaData.category;
				
			if (sourceMetaData.partnerData != null)
				this.partnerData = sourceMetaData.partnerData;
			
			trace (this.toString());
		}
		public function toString():String
		{
			var string:String = "MediaMetaDataVO[" + "tags = " + this.tags + ", title = " + this.title + ", description = " +
				 this.description + ", category = " + this.category + ", partnerData = " + this.partnerData +"]";
			return string;
		}

		public function clone():MediaMetaDataVO
		{
			var clonedMetaData:MediaMetaDataVO = new MediaMetaDataVO(title, tags, category, description);
			clonedMetaData.uid = this.uid;
			return clonedMetaData;
		}
	}
}