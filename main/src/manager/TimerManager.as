package manager
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 *Timer管理器 
	 * @author Administrator
	 * 
	 */	
	public class TimerManager
	{
		private static var _instance:TimerManager;
		
		private var _enterFrameClock:Sprite;
		private var _startTime:Number;
		private var _timeMark:Vector.<uint>;
		private var _handlerMap:Object;
		private var _idArr:Object;
		public function TimerManager()
		{
			this._enterFrameClock = new Sprite();
			this._enterFrameClock.addEventListener(Event.ENTER_FRAME, this.onEnterFrame, false, 10000);
			this._timeMark = new Vector.<uint>(0);
			this._handlerMap = {};
			this._idArr = {};
			this._startTime = new Date().time;
		}
		
		public static function getInstance():TimerManager
		{
			if(_instance == null)
			{
				_instance = new TimerManager();
			}
			
			return _instance;
		}
		
		public function addTimer(interval:uint, callBack:Function=null, onTimerComplete:Function=null, repeat:uint=0, onTimerParams:Array=null, onTimerCompleteParams:Array=null, delay:uint=0):int{
			var id:int = this.getID();
			var time:uint = this.currentTime + interval + delay;
			var timer:timer = new timer(id, interval, callBack, onTimerComplete, onTimerParams, onTimerCompleteParams, repeat, delay);
			this.insertTime(time, timer);
			this._idArr[id] = timer;
			return id;
		}
		
		public function removeTimer(id:int):int
		{
			if (!this._idArr.hasOwnProperty(id.toString())){
				return -1;
			}
			
			var timer:timer = this._idArr[id];
			var time:Number = timer.time;
			var timeList:Array = this._handlerMap[time];
			if (timeList == null){
				return -1;
			}
			((timeList.length) && (timeList.splice(timeList.indexOf(timer), 1)));
			if (timeList.length == 0){
				delete this._handlerMap[time];
			}
			
			if (this._timeMark.indexOf(time) != -1){
				this._timeMark.splice(this._timeMark.indexOf(time), 1);
			}
			
			delete this._idArr[id];
			return -1;
		}
		
		private function onEnterFrame(e:Event):void{
			var _local3:uint;
			var _local4:Array;
			var _local5:timer;
			if (!this._timeMark.length){
				return;
			};
			var _local2:Number = this.currentTime;
			while (this._timeMark.length) {
				if (_local2 > this._timeMark[0]){
					_local3 = this._timeMark.shift();
					_local4 = this._handlerMap[_local3];
					while (((_local4) && (_local4.length))) {
						_local5 = _local4.shift();
						if (_local5.repeat == 0){
							this.insertTime((_local3 + _local5.interval), _local5);
							((_local5.onTimer) && (_local5.onTimer.apply(null, _local5.onTimerParams)));
						} else {
							if (_local5.repeat > 1){
								_local5.repeat--;
								this.insertTime((_local3 + _local5.interval), _local5);
								((_local5.onTimer) && (_local5.onTimer.apply(null, _local5.onTimerParams)));
							} else {
								if (_local5.repeat == 1){
									((_local5.onTimer) && (_local5.onTimer.apply(null, _local5.onTimerParams)));
									((_local5.onTimerComplete) && (_local5.onTimerComplete.apply(null, _local5.onTimerCompleteParams)));
									delete this._idArr[_local5.id];
								}
							}
						}
					}
					delete this._handlerMap[_local3];
				} else {
					break;
				}
			}
		}
		
		private function get currentTime():Number{
			return new Date().time - this._startTime;
		}
		
		private function getID():int{
			var index:int;
			while (index < int.MAX_VALUE) {
				if (!this._idArr[index]){
					return (index);
				}
				index++;
			}
			return 0;
		}
		
		private function insertTime(time:Number, timer:timer):void{
			var index:int;
			var markLen:int = this._timeMark.length;
			if (markLen){
				index = 0;
				while (index < markLen) {
					if (this._timeMark[index] > time){
						this._timeMark.splice(index, 0, time);
						break;
					}
					if (index == (markLen - 1)){
						this._timeMark.push(time);
					}
					index++;
				}
			} else {
				this._timeMark.push(time);
			}
			timer.time = time;
			this._handlerMap[time] = ((this._handlerMap[time]) || ([]));
			this._handlerMap[time].push(timer);
		}
	}
}

class timer {
	
	public var id:uint;
	public var interval:uint;
	public var onTimer:Function;
	public var onTimerComplete:Function;
	public var onTimerParams:Array;
	public var onTimerCompleteParams:Array;
	public var repeat:uint;
	public var delay:uint;
	public var time:Number;
	
	public function timer(id:uint, interval:uint, onTimerHandler:Function, onTimerComplete:Function, onTimerParams:Array=null, onTimerCompleteParams:Array=null, repeat:uint=0, delay:uint=0){
		this.id = id;
		this.interval = interval;
		this.onTimer = onTimerHandler;
		this.onTimerComplete = onTimerComplete;
		this.onTimerParams = onTimerParams;
		this.onTimerCompleteParams = onTimerCompleteParams;
		this.repeat = repeat;
		this.delay = delay;
	}
}