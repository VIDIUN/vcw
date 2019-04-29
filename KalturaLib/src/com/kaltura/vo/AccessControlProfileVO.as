package com.vidiun.vo
{
	import com.adobe.cairngorm.vo.IValueObject;
	import com.vidiun.vo.VidiunAccessControl;
	import com.vidiun.vo.VidiunBaseRestriction;
	import com.vidiun.vo.VidiunCountryRestriction;
	import com.vidiun.vo.VidiunDirectoryRestriction;
	import com.vidiun.vo.VidiunPreviewRestriction;
	import com.vidiun.vo.VidiunSessionRestriction;
	import com.vidiun.vo.VidiunSiteRestriction;
	
	import flash.events.Event;
	
	import mx.utils.ObjectProxy;
	
	/**
	 * This class is a wrapper for the VidiunAccessControl VO.
	 * 
	 * 
	 * 
	 */	
	[Bindable]
	public class AccessControlProfileVO extends ObjectProxy implements IValueObject 
	{
		public static const SELECTED_CHANGED_EVENT : String = "accessControlSelectedChanged";
		/**
		 * marks if this object is selected in the UI controller 
		 */		
		private var _selected:Boolean = false;
		
		/**
		 *  VidiunAccessControl VO, hold all the profile properties
		 */		
		public var profile:VidiunAccessControl;
		
		/**
		 * Constructor 
		 * 
		 */				
		public function AccessControlProfileVO()
		{
			profile = new VidiunAccessControl();
		}
		
		/**
		 *  
		 * @return true if it was selected by the UI controller
		 * 
		 */		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		/**
		 * set the selected parameter 
		 * @param selected - Boolean
		 * 
		 */		
		public function set selected(selected:Boolean):void
		{
			_selected = selected;
			dispatchEvent(new Event(SELECTED_CHANGED_EVENT));
		}
		
		/**
		 * Creates a AccessControlProfileVO  
		 * @return a new AccessControlProfileVO object
		 * 
		 */		
		public function clone():AccessControlProfileVO
		{
			var newAcp:AccessControlProfileVO = new AccessControlProfileVO();
			newAcp.selected = this.selected;
			newAcp.profile.name = this.profile.name.slice();
			newAcp.profile.description = this.profile.description.slice();
			newAcp.profile.createdAt = this.profile.createdAt;
			newAcp.profile.id = this.profile.id;
			newAcp.profile.isDefault = this.profile.isDefault;
			
			for each(var restriction:VidiunBaseRestriction in this.profile.restrictions)
			{
				if(restriction is VidiunSiteRestriction)
				{
					var vsr:VidiunSiteRestriction = new VidiunSiteRestriction();
					vsr.siteRestrictionType = (restriction as VidiunSiteRestriction).siteRestrictionType;
					vsr.siteList = (restriction as VidiunSiteRestriction).siteList;
					newAcp.profile.restrictions.push(vsr);
				}
				else if(restriction is VidiunCountryRestriction)
				{
					var vcr:VidiunCountryRestriction = new VidiunCountryRestriction();
					vcr.countryRestrictionType = (restriction as VidiunCountryRestriction).countryRestrictionType;
					vcr.countryList = (restriction as VidiunCountryRestriction).countryList;
					newAcp.profile.restrictions.push(vcr);
				}
				else if(restriction is VidiunPreviewRestriction)
				{
					var vpr:VidiunPreviewRestriction = new VidiunPreviewRestriction();
					vpr.previewLength = (restriction as VidiunPreviewRestriction).previewLength;
					newAcp.profile.restrictions.push(vpr);
				}
				else if(restriction is VidiunSessionRestriction)
				{
					var vser:VidiunSessionRestriction = new VidiunSessionRestriction();
					newAcp.profile.restrictions.push(vser);
				}
				else if(restriction is VidiunDirectoryRestriction)
				{
					var vdr:VidiunDirectoryRestriction = new VidiunDirectoryRestriction();
					vdr.directoryRestrictionType = (restriction as VidiunDirectoryRestriction).directoryRestrictionType;
					newAcp.profile.restrictions.push(vdr);
				}
			}

			
			return newAcp;
		}
	
	}
}