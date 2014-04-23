package events
{
	import flash.events.Event;
	
	public class BaseEvent extends Event
	{
		public static const NAME:String = "base_event_name";
		
		private var _command:String;
		private var _data:Object;
		
		public function BaseEvent(type:String, param:Object =null)
		{
			super(BaseEvent.NAME, false, false);
			this._command = type;
			this._data = param
		}
		
		override public function clone():Event{
			return new BaseEvent(this._command, this._data);
		}
		
		public function get data():Object{
			return this._data;
		}
		
		public function get command():String{
			return this._command;
		}
	}
}