package core
{
	import events.BaseEvent;
	
	import flash.display.Sprite;
	
	public class BaseSprite extends Sprite
	{
		public function BaseSprite()
		{
			super();
		}
		
		/**
		 *派发事件 
		 * @param command	命令
		 * @param data		数据
		 * 
		 */		
		protected function dispatch(command:String=null, data:Object=null):void{
			var e:BaseEvent = new BaseEvent(command, data);
			dispatchEvent(e);
		}
		
		//清理
		protected function clear():void
		{
			
		}
		//销毁
		protected function dispose():void
		{
			if(this.parent)
			{
				this.parent.removeChild(this)
			}
			this.clear();
		}
	}
}