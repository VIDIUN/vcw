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
	import com.adobe_cw.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe_cw.adobe.cairngorm.control.CairngormEvent;
	import com.bjorn.event.ChainEvent;
	import com.vidiun.contributionWizard.business.AddEntriesDelegate;
	import com.vidiun.contributionWizard.business.AddEntriesResult;
	import com.vidiun.contributionWizard.business.ServiceCanceller;
	import com.vidiun.contributionWizard.events.CloseWizardEvent;
	import com.vidiun.contributionWizard.events.EntriesAddedEvent;
	import com.vidiun.contributionWizard.events.PartnerNotificationsEvent;
	import com.vidiun.contributionWizard.model.PendingActions;
	import com.vidiun.contributionWizard.model.WizardModelLocator;
	import com.vidiun.contributionWizard.view.resources.ResourceBundleNames;
	import com.vidiun.vo.importees.ImportURLVO;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.resources.ResourceManager;
	import mx.rpc.IResponder;

	public class AddEntriesCommand extends SequenceCommand implements IResponder
	{
		private var _model:WizardModelLocator = WizardModelLocator.getInstance();

		override public function execute(event:CairngormEvent):void
		{
			var addSearch:Boolean = _model.mediaProviders.activeMediaProvider.addSearchResult;
	     	var importList:ArrayCollection;
	     	
	     	nextEvent = (event as ChainEvent).nextChainedEvent;

	     	if(addSearch)
	     	{
		     	var searchEntries:Array = new Array();
		     	importList = _model.importData.importCart.importItemsArray;
		     	for each(var item:ImportURLVO in importList)
		     	{
		     		searchEntries.push
		     						(
		     							{
		     								uniqueID: 	item.uniqueID ? item.uniqueID.toString() : "",
		     								sourceLink: item.sourceLink ? item.sourceLink.toString() : "",
											thumbURL: 	item.thumbURL ? item.thumbURL.toString() : "",
											mediaType: 	item.mediaTypeCode ? item.mediaTypeCode.toString() : ""
		     							}
		     						)
		     	}
		     	notifyAddEntriesComplete(searchEntries);
		     	executeNextCommand();
	     	}
	     	else
	     	{
				var delegate:AddEntriesDelegate = new AddEntriesDelegate(this);
				importList = _model.importData.importCart.importItemsArray;
	
				var serviceCanceller:ServiceCanceller = delegate.addEntries(importList, _model.context, _model.importData.creditsVo);
				_model.pendingActions.setPendingAction(PendingActions.ADDING_ENTRIES, serviceCanceller);
	     	}
		}

		public function result(data:Object):void
		{
			//_model.pendingActions.isPending = false;  // if we remove the popup it look like we can do more things with the wizard, and apparently this is a lie. (missing end screen?)
			var addEntriesResult:AddEntriesResult = data as AddEntriesResult;

			setNewVshowId(addEntriesResult.entriesInfoList[0].vshowId);

			if (addEntriesResult.notificationsIds)
			{
				var checkNotificationsEvent:PartnerNotificationsEvent = new PartnerNotificationsEvent(PartnerNotificationsEvent.CHECK_NOTIFICATIONS, addEntriesResult);
				checkNotificationsEvent.dispatch();
			}
			else if (addEntriesResult.notificationsList)
			{
				var sendNotificationsEvent:PartnerNotificationsEvent = new PartnerNotificationsEvent(PartnerNotificationsEvent.SEND_NOTIFICATIONS, addEntriesResult);
				sendNotificationsEvent.dispatch();
			}
			else
			{
				notifyAddEntriesComplete(addEntriesResult.entriesInfoList);
			}
			
			_model.wereEntriesAdded = true;
			_model.wereEntriesAdded = false;
			executeNextCommand();
		}

		public function fault(info:Object):void
		{
			_model.pendingActions.isPending = false;
			//TODO: move it to the view (localized string already exist)
			trace("Add entry call failed");
			var msg:String = ResourceManager.getInstance().getString(ResourceBundleNames.ERRORS, "ADD_ENTRIES_FAILED");
			Alert.show(msg ? msg : "Add entry failed");
			
			var close:CloseWizardEvent = new CloseWizardEvent(CloseWizardEvent.CLOSE_WIZARD);
			close.dispatch();

		}

		private function setNewVshowId(newVshowId:String):void
		{
			_model.context.vshowId = newVshowId;
		}

		private function notifyAddEntriesComplete(entriesInfoList:Array):void
		{
			var addEntriesCompleteEvent:EntriesAddedEvent = new EntriesAddedEvent(EntriesAddedEvent.NOTIFY_ADD_ENTRIES_COMPLETE, entriesInfoList);
			addEntriesCompleteEvent.dispatch();
		}
	}
}