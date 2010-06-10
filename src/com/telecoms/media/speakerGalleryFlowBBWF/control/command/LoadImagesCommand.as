package com.telecoms.media.speakerGalleryFlowBBWF.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.telecoms.media.speakerGalleryFlowBBWF.control.delegates.LoadImagesDelegate;
	import com.telecoms.media.speakerGalleryFlowBBWF.model.PhotosModelLocator;
	import flash.external.ExternalInterface;
	
	import mx.controls.Alert;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadImagesCommand implements ICommand
	{		
		private var model:PhotosModelLocator = PhotosModelLocator.getInstance();
		public function execute(event:CairngormEvent):void
		{
			var responder:Responder = new Responder(onResults,onFault);
			var delegate:LoadImagesDelegate = new LoadImagesDelegate(responder);
			delegate.loadPhotos();
		}
		private function onFault(event:FaultEvent):void
		{
			Alert.show('No photos were found...');
		}
		private function onResults(event:ResultEvent):void
		{
			model.photoAdresses = event.token.result as XML;
			
			trace('URLs are '+model.photoAdresses);
			
			var totalImages:int = model.photoAdresses.speaker.length();
			for (var i:int=0;i<totalImages;i++){
			var photo:String = new String;
			photo = model.photoAdresses.speaker[i].imageurl;
			model.photoObjects.addItem(photo);
			}
		}
	}
}