package observer
{
	/**
	 *消息体 
	 * @author Administrator
	 * 
	 */	
	public class Notification
	{
		private var _name:String;
		private var _param:Object;
		
		public function Notification(name:String,param:Object=null)
		{
			this._name = name;
			this._param = param;
		}
		
		public function get name():String
		{
			return this._name;
		}
		
		public function get data():Object
		{
			return this._param;
		}
	}
}