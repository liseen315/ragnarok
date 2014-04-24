package observer
{
	import flash.utils.Dictionary;

	/**
	 *派发器 
	 * @author Administrator
	 * 
	 */	
	public class LDispatch
	{
		private static var _instance:LDispatch;
		private var _notificationMap:Dictionary;
		
		public function LDispatch()
		{
			_notificationMap = new Dictionary();
		}
		
		/**
		 *获取单例
		 * @return 
		 * 
		 */		
		public static function getInstance():LDispatch
		{
			if(!_instance){
				_instance = new LDispatch();
			}
			
			return _instance;
		}
		
		/**
		 *派发 可以考虑使用消息池.回头加上
		 * @param type	类型
		 * @param param	消息体
		 * 
		 */		
		public static function dispatch(type:String,data:Object=null):void
		{
			LDispatch.getInstance().execute(new Notification(type,data));
		}
		
		/**
		 *添加侦听 
		 * @param type
		 * @param fun
		 * 
		 */		
		public static function addListener(type:String,fun:Function):void
		{
			LDispatch.getInstance().add(type,fun);
		}
		
		/**
		 *移除侦听 
		 * @param type	类型
		 * @param callBack	回调方法
		 * 
		 */		
		public static function removeListener(type:String,fun:Function):void
		{
			LDispatch.getInstance().remove(type,fun);
		}
		
		/**
		 *向观察者字典内存放回调方法 
		 * @param type
		 * @param callBack
		 * 
		 */		
		private function add(type:String,callBack:Function):void
		{
			if (!this._notificationMap[type]){
				this._notificationMap[type] = new Dic();
			};
			Dic(this._notificationMap[type]).regHandler(callBack);
		}
		
		/**
		 *从字典内移除 
		 * @param type
		 * @param callBack
		 * 
		 */		
		private function remove(type:String,callBack:Function):void
		{
			if (!this._notificationMap[type]){
				return;
			}
			if (Dic(this._notificationMap[type]).hasHandler(callBack)){
				Dic(this._notificationMap[type]).removeHandler(type,callBack);
			}
		}
		
		/**
		 *执行 
		 * @param type
		 * @param param
		 * 
		 */		
		private function execute(not:Notification):void
		{
			var noticName:String = not.name;
			if (this.hasNotification(noticName)){
				Dic(this._notificationMap[noticName]).handle(not);
			}
		}
		
		private function hasNotification(noticName:String):Boolean
		{
			return this._notificationMap[noticName];
		}
		
	}
}