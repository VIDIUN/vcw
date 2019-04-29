package com.vidiun.contributionWizard.model
{
	import com.bjorn.event.ChainEvent;
	import com.vidiun.contributionWizard.enums.VCWWorkflowState;
	import com.vidiun.contributionWizard.events.AddEntriesEvent;
	import com.vidiun.contributionWizard.events.WorkflowEvent;

	import flash.events.MouseEvent;

	public class WorkflowStatesList
	{
		public function WorkflowStatesList(enableIntroScreen:Boolean, enableTagging:Boolean, enableFinishScreen:Boolean):void
		{
			var introScreen:WorkflowState = new WorkflowState(VCWWorkflowState.INTRO_SCREEN, 		new WorkflowEvent(WorkflowEvent.CHANGE_WORKFLOW, VCWWorkflowState.INTRO_SCREEN));
			var importMedia:WorkflowState = new WorkflowState(VCWWorkflowState.IMPORT_MEDIA, 		new WorkflowEvent(WorkflowEvent.CHANGE_WORKFLOW, VCWWorkflowState.IMPORT_MEDIA));
			var taggingScreen:WorkflowState = new WorkflowState(VCWWorkflowState.TAGGING,			new WorkflowEvent(WorkflowEvent.CHANGE_WORKFLOW, VCWWorkflowState.TAGGING));
			var addEntrieshEvent:WorkflowState = new WorkflowState(VCWWorkflowState.ADD_ENTRIES,	new AddEntriesEvent(AddEntriesEvent.ADD_ENTRIES));
			var finishScreenEvent:WorkflowState = new WorkflowState(VCWWorkflowState.FINISH_SCREEN, new WorkflowEvent(WorkflowEvent.CHANGE_WORKFLOW, VCWWorkflowState.FINISH_SCREEN));

			states = [introScreen, importMedia, taggingScreen, addEntrieshEvent, finishScreenEvent];

			if (!enableIntroScreen)
				removeStateByName(VCWWorkflowState.INTRO_SCREEN);

			if (!enableTagging)
				removeStateByName(VCWWorkflowState.TAGGING);

			if (!enableFinishScreen)
				removeStateByName(VCWWorkflowState.FINISH_SCREEN);

			mergeStates();
		}
		public var states:Array;

		public function getStateByName(stateName:String):WorkflowState
		{
			return states.filter(
				function statesNameFilter(state:WorkflowState, i:int, list:Array):Boolean
				{
					return state.name == stateName;
				}
			)[0];
		}

		private function removeStateByName(name:String):void
		{
			var state:WorkflowState = getStateByName(name);
			var stateIndex:int = states.indexOf(state);
			states.splice(stateIndex, 1);
		}

		/**
		 * Adds a nextEvent to the AddEntriesEvent if exists (currently only WorkflowEvent that navigates to the finish screen)
		 *
		 */
		private function mergeStates():void
		{
			var addEntriesState:WorkflowState = getStateByName(VCWWorkflowState.ADD_ENTRIES);
			var addEntriesIndex:int = states.indexOf(addEntriesState);
			var nextState:WorkflowState =  addEntriesIndex < states.length - 1 ? states[addEntriesIndex + 1] : null;

			var addEntriesEvent:ChainEvent = ChainEvent(addEntriesState.cairngormEvent);
			addEntriesEvent.nextChainedEvent = nextState ? ChainEvent(nextState.cairngormEvent) : null;
			addEntriesState.cairngormEvent = addEntriesEvent;
		}

	}
}