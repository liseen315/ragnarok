package manager
{
	import consts.nots.LoaderNote;
	
	import flash.utils.Dictionary;
	
	import observer.LDispatch;

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
		
		private function bmLoaded():void
		{
			
		}
		
		private function bmLoadFailed():void
		{
			
		}
	}
}