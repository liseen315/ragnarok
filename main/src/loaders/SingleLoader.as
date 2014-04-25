package loaders
{
	import br.com.stimuli.loading.BulkLoader;
	
	import consts.nots.LoaderNote;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	import observer.LDispatch;
	import observer.Notification;
	
	import vos.LoaderDTO;

	public class SingleLoader extends CoreLoader
	{
		private const NAME:String = "single_loader_name";
		private var request:Object;
		
		public function SingleLoader()
		{
			super(NAME, 1);
			this.request = new Object();
			this.addListeners();
		}
		
		private function addListeners():void
		{
			LDispatch.addListener(LoaderNote.LOAD_SINGLE,this.loadHandler);	
		}
		
		private function removeListeners():void
		{
			LDispatch.removeListener(LoaderNote.LOAD_SINGLE,this.loadHandler);
		}
		
		private function loadHandler(notic:Notification):void
		{
			if(notic.data is LoaderDTO)
			{
				this.coreLoadData(notic.data as LoaderDTO);
			}else{
			
			}
			
			if(loader._isPaused)
			{
				loader.start();
			}
			
		}
		
		private function coreLoadData(lDTO:LoaderDTO):void
		{
			var loadObj:Object = {
				id:lDTO.url,
				maxTries:1,
				context:lDTO.context
			}
			var loadPath:String = lDTO.url;
			this.request[loadPath] = lDTO;
			loader.add(loadPath,loadObj);
			loader.get(loadPath).addEventListener(BulkLoader.COMPLETE, this.onCompleteHandler);
			loader.get(loadPath).addEventListener(BulkLoader.ERROR, this.onIOError);
		}
		
		private function onCompleteHandler(e:Event):void
		{
			var id:String = e.target.id;
			var lDTO:LoaderDTO = this.request[id] as LoaderDTO;
			if (lDTO){
				this.removeEvent(id);
				this.removeReq(id);
				doData(id, lDTO);
			}
		}
		
		override protected function doDataHandler(lDTO:LoaderDTO, content:*):void
		{
			var tempContentObj:*;
			if (lDTO.callbackParam){
				tempContentObj = new Object();
				tempContentObj.content = content;
				tempContentObj.param = lDTO.callbackParam;
			} else {
				tempContentObj = content;
			};
			if (lDTO.callbackNote){
				LDispatch.dispatch(lDTO.callbackNote,tempContentObj);
			} else {
				LDispatch.dispatch(LoaderNote.SINGLE_LOADED,tempContentObj);
			};
		}
		
		private function onIOError(e:ErrorEvent):void
		{
			
		}
		
		private function removeEvent(id:String):void{
			
			if (loader.get(id)){
				loader.get(id).removeEventListener(BulkLoader.COMPLETE, this.onCompleteHandler);
				loader.get(id).removeEventListener(BulkLoader.ERROR, this.onIOError);
			}
		}
		
		private function removeReq(id:String):void{
			
			if(this.request[id])
			{
				delete this.request[id]
			}
		}
	}
}