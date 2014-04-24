package manager
{
	import consts.nots.LoaderNote;
	import consts.nots.LoadingNote;
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import observer.LDispatch;
	import observer.Notification;
	
	import vos.LoaderDTO;

	/**
	 *加载管理器 
	 * @author Administrator
	 * 
	 */	
	public class LoadingManager
	{
		private static var _instance:LoadingManager;
		
		private var _bmdic:Dictionary;
		public function LoadingManager()
		{
			this._bmdic = new Dictionary();
			LDispatch.addListener(LoaderNote.LM_SINGLE_LOADED,this.bmLoaded);
			LDispatch.addListener(LoaderNote.LM_SINGLE_FAILED,this.bmLoadFailed);
		}
		
		public static function getInstance():LoadingManager
		{
			if(_instance == null)
			{
				_instance = new LoadingManager();
			}
			return _instance;
		}
		
		public function loadBitmap(path:String):void
		{
			if(this._bmdic[path])
			{
				LDispatch.dispatch(LoadingNote.LOADING_IMG_LOADED,{
					url:path,
					bmd:this._bmdic[path]
				})
				return 
			}
			
			var lDTO:LoaderDTO = new LoaderDTO();
			lDTO.id = lDTO.url = path;
			lDTO.isloop = false;
			lDTO.callbackNote = LoaderNote.LM_SINGLE_LOADED;
			lDTO.callbackParam = {
				id:path,
				url:path
			}
			
			LDispatch.dispatch(LoaderNote.LOAD_SINGLE,lDTO);
		}
		
		private function bmLoaded(notic:Notification):void
		{
			var idStr:String = (notic.data.param) ? notic.data.param.id.toString() : null;
			if (idStr == null){
				return;
			}
			this._bmdic[idStr] = Bitmap(notic.data.content).bitmapData;
			LDispatch.dispatch(LoadingNote.LOADING_IMG_LOADED,{
				url:idStr,
				bmd:this._bmdic[idStr]
			});
		}
		
		private function bmLoadFailed():void
		{
			
		}
	}
}