package events
{
	import flash.events.Event;
	
	public class SocketDataEvent extends Event
	{
		private var _callbackParames:Object;
		private var _error:String;
		private var _result:Object;
		
		public function SocketDataEvent(type:String)
		{
			super(type);
		}
		
		public function set error(value:String):void{
			this._error = value;
		}
		public function get callbackParames():Object{
			return this._callbackParames;
		}
		public function set callbackParames(value:Object):void{
			this._callbackParames = value;
		}
		public function get error():String{
			return this._error;
		}
		public function get callbackName():String{
			return type;
		}
		public function get data():Object{
			return this._result;
		}
		public function set data(value:Object):void{
			this._result = value;
		}
		override public function clone():Event{
			var e:SocketDataEvent = new SocketDataEvent(type);
			e.callbackParames = new SocketDataEvent(type);
			e.error = this.error;
			return e;
		}
	}
}