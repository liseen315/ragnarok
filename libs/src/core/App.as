package core
{
	import consts.nots.LoadingNote;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import observer.LDispatch;
	import observer.Notification;
	
	public class App extends Sprite
	{
		public function App()
		{
			super();
		}
		
		//设置舞台属性		
		protected function setStageProperty():void{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.quality = StageQuality.BEST;
		}
		
		protected function regNot():void
		{
			LDispatch.addListener(LoadingNote.LOADING_IMG_LOADED,this.mainImgLoaded);
		}
		
		protected function removeNot():void
		{
			LDispatch.removeListener(LoadingNote.LOADING_IMG_LOADED,this.mainImgLoaded);
		}
		
		private function mainImgLoaded(notic:Notification):void
		{
			this.removeNot();
			this.dispatchEvent(new Event("mainok"));
		}
	}
}