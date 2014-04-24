package modules.main
{
	import consts.nots.LoadingNote;
	import consts.nots.MainNote;
	
	import flash.display.Sprite;
	
	import gameinterfaces.IModule;
	
	import manager.LoadingManager;
	import manager.UrlManager;
	
	import observer.LDispatch;
	import observer.Notification;
	
	public class MainModule extends Sprite implements IModule
	{
		public function MainModule()
		{
			super();
		}
		
		public function register():void
		{
			var mainLoadMediator:MainLoadMediator = new MainLoadMediator();
			var mainMediator:MainMediator = new MainMediator();
			
			LDispatch.addListener(LoadingNote.LOADING_IMG_LOADED,this.registerReady);
			
			//开始加载主Loading背景图
			var mainImgPath:String = UrlManager.getInstance().getLoadingImgUrl("main");
			LoadingManager.getInstance().loadBitmap(mainImgPath);
		}
		
		private function registerReady(notic:Notification):void
		{
			LDispatch.removeListener(LoadingNote.LOADING_IMG_LOADED,this.registerReady);
			LDispatch.dispatch(MainNote.SHOW_MAIN_LOADING);
		}
	}
}