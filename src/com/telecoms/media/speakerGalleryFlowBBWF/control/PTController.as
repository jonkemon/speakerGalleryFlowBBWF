package com.telecoms.media.speakerGalleryFlowBBWF.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.telecoms.media.speakerGalleryFlowBBWF.control.command.LoadImagesCommand;
	import com.telecoms.media.speakerGalleryFlowBBWF.control.events.gallery.LoadImagesEvent;

	public class PTController extends FrontController
	{
		public function PTController()
		{
			super();
			addCommand(LoadImagesEvent.EVENT_ID, LoadImagesCommand);
		}
		
	}
}