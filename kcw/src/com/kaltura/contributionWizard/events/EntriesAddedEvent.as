package com.vidiun.contributionWizard.events
{
	import com.arc90.modular.AbstractModuleEvent;
	import com.bjorn.event.ChainEvent;

	public class EntriesAddedEvent extends ChainEvent
	{

		public static const NOTIFY_ADD_ENTRIES_COMPLETE:String = "notifyAddEntriesComplete";

		/**
		 *Contains a list of Object objects, each contains an information about an added entry in this format:
		 * [
		 *	  {
		 *	   entryId		: "2345fd324",
		 *	   mediaType	: "video",
		 *	   vshowId		: "10534"
		 *	  }
		 *	...
		 *	]
		 */
		public var entriesInfoList:Array;

		public function EntriesAddedEvent(type:String, entriesInfoList:Array)
		{
			super(type);
			this.entriesInfoList = entriesInfoList;
		}
	}
}