package core
{
	import observer.LDispatch;
	import observer.Notification;

	/**
	 *中介者用于调停视图 
	 * @author Administrator
	 * 
	 */	
	public class Mediator
	{
		public function Mediator()
		{
			this.regNotifications();
		}
		
		//获取通知列表
		protected function getNotifactionList():Array{
			return [];
		}
		//处理通知
		protected function handleNotification(notic:Notification):void
		{
			
		}
		
		//删除通知
		protected function removeNotifications():void
		{
			var listLen:int = this.getNotifactionList().length;
			var index:int = 0;
			while(index<listLen)
			{
				LDispatch.removeListener(this.getNotifactionList()[index],this.handleNotification);
				index++
			}
		}
		
		private function regNotifications():void
		{
			var listLen:int = this.getNotifactionList().length;
			var index:int = 0;
			while(index<listLen)
			{
				LDispatch.addListener(this.getNotifactionList()[index],this.handleNotification);
				index++
			}
		}
	}
}