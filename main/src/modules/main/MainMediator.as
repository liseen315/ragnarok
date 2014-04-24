package modules.main
{
	import consts.LoadingConst;
	import consts.nots.LoadingNote;
	import consts.nots.MainNote;
	
	import core.Mediator;
	
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
			return [MainNote.SHOW_MAIN_LOADING];
		}
		
		override protected function handleNotification(notic:Notification):void
		{
			switch(notic.name)
			{
				case MainNote.SHOW_MAIN_LOADING:
					this.showLoading(LoadingConst.MAIN);
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
		
		private function showMainLoading():void
		{
			this._mainLoading = new MainLoading();
			this._mainLoading.show(true);
		}
	}
}