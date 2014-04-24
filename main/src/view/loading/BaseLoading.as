package view.loading
{
	import consts.LoadingConst;
	
	import core.BaseSprite;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	import gamedata.GlobalVars;
	
	import gameinterfaces.ILoading;
	
	import manager.LayerManager;
	
	public class BaseLoading extends BaseSprite implements ILoading
	{
		protected const maskColor:uint = 0;
		
		protected var _id:int;
		protected var maskAlpha:Number = 0.2;
		protected var _mask:Sprite;
		protected var _content:Sprite;
		protected var _bg:Bitmap;
		protected var _loading_w:int = 100;
		protected var _init_x:int = 0;
		protected var _pscale:Number = 0;
		
		public function BaseLoading()
		{
			super();
			this.init();
		}
		
		public function show(addMask:Boolean=true):void
		{
			if(addMask)
			{
				this.addMask();
			}
			
			this.addContent();
			LayerManager.getInstance()._loading.addChild(this);
		}
		
		public function hide():void
		{
			if (this._pscale < 1){
				this.removeTimer();
				this.loadingMove();
			} else {
				this.clear();
			}
		}
		
		protected function init():void
		{
			this._id = LoadingConst.NONE;
		}
		
		protected function addMask():void
		{
			this.removeMask();
			this._mask = new Sprite();
			this.resetMask();
			this.addChild(this._mask);
		}
		
		protected function removeMask():void
		{
			if(this._mask)
			{
				if (this._mask.parent){
					this._mask.parent.removeChild(this._mask);
				}
				if (this._mask.graphics){
					this._mask.graphics.clear();
				}
				this._mask = null;
			}
		}
		
		protected function addContent():void
		{
			this.removeContent();
			this._content = new Sprite();
			addChild(this._content);
		}
		
		protected function removeContent():void
		{
			if (this._content){
				if (this._content.parent){
					this._content.parent.removeChild(this._content);
				}
				this._content = null;
			}
		}
		
		protected function removeTimer():void{
			
		}
		
		protected function loadingMove(_arg1:Number=0.2):void
		{
			
		}
		
		override protected function clear():void{
			if (graphics){
				graphics.clear();
			}
			this.removeTimer();
			this.removeMask();
			this.removeContent();
			if (parent){
				parent.removeChild(this);
			}
		}
		
		
		private function resetMask():void{
			if (this._mask){
				if (this._mask.graphics){
					this._mask.graphics.clear();
				};
				this._mask.graphics.beginFill(this.maskColor, this.maskAlpha);
				this._mask.graphics.drawRect(0, 0, GlobalVars.stageW, GlobalVars.stageH);
				this._mask.graphics.endFill();
			}
		}
	}
}