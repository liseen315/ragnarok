package modules.main
{
	import consts.LoadingConst;
	import consts.nots.LoaderNote;
	import consts.nots.LoadingNote;
	import consts.nots.MainNote;
	
	import core.Mediator;
	
	import game.screen.ScreenShake;
	
	import gamedata.Relation;
	import gamedata.main.MainLoginData;
	
	import observer.Notification;
	
	import view.loading.MainLoading;
	
	public class MainMediator extends Mediator
	{
		private var _mainLoading:MainLoading;
		public function MainMediator()
		{
			super();
		}
		
		override protected function getNotifactionList():Array{
			return [MainNote.SHOW_MAIN_LOADING,MainNote.CLEAR_MAIN_LOADING,LoaderNote.INIT_LOADED];
		}
		
		override protected function handleNotification(notic:Notification):void
		{
			switch(notic.name)
			{
				case MainNote.SHOW_MAIN_LOADING:
					this.showLoading(LoadingConst.MAIN);
					break;
				case MainNote.CLEAR_MAIN_LOADING:
					this.clearLoading(LoadingConst.MAIN);
					break;
				case LoaderNote.INIT_LOADED:
					this.mainRun();
					break;
			}
		}
		
		private function showLoading(loadingType:int,dataObj:Object=null):void
		{
			switch(loadingType)
			{
				case LoadingConst.MAIN:
					this.showMainLoading();
					break;
			}
		}
		
		private function clearLoading(loadingType:int):void
		{
			switch(loadingType)
			{
				case LoadingConst.MAIN:
					this.clearMainLoading();
					break;
			}	
		}
		
		private function showMainLoading():void
		{
			this._mainLoading = new MainLoading();
			this._mainLoading.show(true);
		}
		
		private function clearMainLoading():void
		{
			if (this._mainLoading){
				this._mainLoading.hide();
				this._mainLoading = null;
			}
		}
		
		//启动
		private function mainRun():void
		{
			Relation.getInstance().register();
			var screenShark:ScreenShake = new ScreenShake();
			MainLoginData.getInstance().login();
		}
	}
}