package loaders
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import consts.SuffixConst;
	
	import flash.display.Loader;
	
	import manager.TimerManager;
	
	import observer.Notification;
	
	import vos.LoaderDTO;

	public class CoreLoader
	{
		protected var loader:BulkLoader;
		protected var timerId:int = -1;
		protected var delay:int = 33;
		protected var curReload:int = 0;
		public function CoreLoader(name:String,retryNum:int = 12)
		{
			this.loader = new BulkLoader(name,retryNum);
			this.loader.addEventListener(BulkProgressEvent.COMPLETE, this.completeHandler);
		}
		
		protected function loadData(notic:Notification):void{
		}
		
		protected function completeHandler(e:BulkProgressEvent):void{
		}
		
		protected function doData(key:String, lDTO:LoaderDTO):void
		{
			var loader:Loader;
			var content:* = this.loader.getContent(key,true);
			var callBackParam:Object = lDTO.callbackParam;
			if (!(callBackParam) || !(callBackParam.fix)){
				this.doDataHandler(lDTO, content);
				return;
			}
			
			switch (callBackParam.fix){
				case SuffixConst.SUF_SWF:
//					loader = new Loader();
//					this.dodataDic[_local5] = _arg2;
//					loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.loadCompleteHandler);
//					loader.loadBytes(MainParser.ins.udata((_local3 as ByteArray)), _arg2.context);
					break;
				default:
					this.doDataHandler(lDTO, content);
			}
		}
		
		protected function doDataHandler(lDTO:LoaderDTO, content:*):void
		{
			
		}
		
		protected function addTimer():void
		{
			this.removeTimer();
			this.timerId = TimerManager.getInstance().addTimer(this.delay, this.timeHandler);
		}
		
		protected function removeTimer():void
		{
			if(this.timerId == -1)
			{
				return;
			}
			this.timerId = TimerManager.getInstance().removeTimer(this.timerId);
		}
		
		protected function timeHandler():void
		{
			
			if (this.loader == null){
				this.removeTimer();
				return;
			}
			var itemLen:int = this.loader.items.length;
			if(this.loader.itemsLoaded == itemLen)
			{
				this.curReload = 0;
				this.removeTimer();
				this.allLoaded();
			}
		}
		
		protected function allLoaded():void{
			this.endLoader();
		}
		
		protected function endLoader():void{
			if (this.loader){
				this.loader.pauseAll();
				this.loader.removeAll();
			}
		}
	}
}