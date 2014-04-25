package game.screen
{
	import consts.nots.MainNote;
	
	import observer.LDispatch;
	import observer.Notification;

	/**
	 *震屏 
	 * @author Administrator
	 * 
	 */	
	public class ScreenShake
	{
		public function ScreenShake()
		{
			this.addEventListeners();
		}
		
		private function addEventListeners():void
		{
			LDispatch.addListener(MainNote.SHARK_SCREEN,this.onSharkScreen);
			LDispatch.addListener(MainNote.CLEAR_SHARK_SCREEN,this.clearShark);
		}
		
		private function onSharkScreen(notic:Notification):void
		{
			
		}
		
		private function clearShark(notic:Notification):void
		{
			
		}
	}
}