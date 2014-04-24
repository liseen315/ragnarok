package view.loading
{
	import consts.LoadingConst;
	
	import flash.display.Bitmap;
	
	import gamedata.GlobalVars;
	
	import manager.LoadingManager;
	import manager.UrlManager;

	public class MainLoading extends BaseLoading
	{
		private var _main_url:String;
		
		public function MainLoading()
		{
			super();
		}
		
		final override protected function init():void{
			super.init();
			_id = LoadingConst.MAIN;
			_loading_w = 790;
			_init_x = 34;
			_pscale = 0;
		}
		
		final override public function hide():void{
			super.hide();
		}
		
		final override protected function addContent():void
		{
			super.addContent();
			this._main_url = UrlManager.getInstance().getLoadingImgUrl("main");
			this._bg = new Bitmap(LoadingManager.getInstance().getBM(this._main_url));
			this._bg.x = (GlobalVars.stageW - this._bg.width) >> 1 ;
			this._bg.y = (GlobalVars.stageH - this._bg.height) >> 1;
			this.addChild(this._bg);
		}
	}
}