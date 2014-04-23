package modules.main
{
	import consts.nots.ConstNotifactionType;
	
	import flash.display.Sprite;
	
	import gameinterfaces.IModule;
	
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
			
			LDispatch.addListener(ConstNotifactionType.LOADING_IMG_LOADED,this.registerReady);
			var mainImgPath:String = UrlManager.getInstance().getLoadingImgUrl("main");
			
		}
		
		private function registerReady(notic:Notification):void
		{
			LDispatch.removeListener(ConstNotifactionType.LOADING_IMG_LOADED,this.registerReady);
			
		}
	}
}