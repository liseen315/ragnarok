package view.loading
{
	import component.control.label.Label;
	import component.expand.fonts.TextFormatLib;
	
	import consts.LoadingConst;
	
	import flash.display.Bitmap;
	
	import gamedata.GlobalVars;
	
	import manager.LoadingManager;
	import manager.UrlManager;

	public class MainLoading extends BaseLoading
	{
		private var _main_url:String;
		private var _tipsLabel:Label;
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
			//bg
			this._main_url = UrlManager.getInstance().getLoadingImgUrl("main");
			this._bg = new Bitmap(LoadingManager.getInstance().getBM(this._main_url));
			this._bg.x = (GlobalVars.stageW - this._bg.width) >> 1 ;
			this._bg.y = (GlobalVars.stageH - this._bg.height) >> 1;
			this.addChild(this._bg);
			//bar
			this._loadingMc = new MainLoadingBar();
			this._loadingMc.x = (GlobalVars.stageW - 860) >> 1;
			this._loadingMc.y = (GlobalVars.stageH - 120);
			this._loadingMc.loading_mask.width = 1;
			this._loadingMc.loading_point.x = _init_x;
			addChild(this._loadingMc);
			//loadingTips
			var randomTipIndex:int = 0;
			randomTipIndex = Math.round(Math.random() * GlobalVars.loadingtxt.length);
			var tips:String =  GlobalVars.loadingtxt[randomTipIndex];
			this._tipsLabel = new Label(tips,TextFormatLib.song_FFFFFF_center_12,null,false);
			this._tipsLabel.width = GlobalVars.stageW-100;
			this._tipsLabel.x = (GlobalVars.stageW-this._tipsLabel.width) >> 1;
			this._tipsLabel.y = GlobalVars.stageH - 70;
			this.addChild(this._tipsLabel);
			
			addTimer(20+Math.round((Math.random() * 5)));
		}
		
		final override protected function removeContent():void
		{
			super.removeContent();
			if (_bg){
				if (_bg.parent){
					_bg.parent.removeChild(_bg);
				}
				if (_bg.bitmapData){
					_bg.bitmapData.dispose();
				}
				_bg = null;
			}
			
			if (_loadingMc){
				if (_loadingMc.parent){
					_loadingMc.parent.removeChild(_loadingMc);
				}
				_loadingMc = null;
			}
			LoadingManager.getInstance().clear(this._main_url);
		}
		
		final override protected function timeHandler():void
		{
			_pscale = (_pscale + 0.002);
			_pscale = ((_pscale * 1000) >> 0) / 1000;
			if (_pscale >= _max_scale){
				_pscale = _max_scale;
				removeTimer();
			}
			this.setLoadingPosition();
		}
	}
}