package net
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	/**
	 *看样子作者很稀饭巴比伦啊 
	 * @author Administrator
	 * 
	 */	
	public class BabelTimeSocket implements IEventDispatcher
	{
		private static var _instance:BabelTimeSocket;
		
		private var _eventDispatcher:IEventDispatcher;
		private var _callbackParamDic:Dictionary;
		private var _socket:Socket;
		private var _host:String;
		private var _port:int;
		private var _useEncrypt:Boolean;
		private var token:String = "0";//标记
		
		public var onCloseCallback:Function;
		public function BabelTimeSocket()
		{
			this.initEventDispatcher();
			this.initCallBackDic();
			this.initSocket();
		}
		
		public static function getInstance():BabelTimeSocket
		{
			if(_instance == null)
			{
				_instance = new BabelTimeSocket();
			}
			
			return _instance;
		}
		
		/**
		 *连接 
		 * @param host
		 * @param port
		 * 
		 */		
		public function connect(host:String,port:int):void
		{
			if(this._socket.connected)
			{
				return
			}
			this._host = host;
			this._port = port;
			this._socket.connect(this._host,this._port);
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			this._eventDispatcher.addEventListener(type,listener,useCapture,priority,useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			this._eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return this._eventDispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return this._eventDispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return this._eventDispatcher.willTrigger(type);
		}
		
		/**
		 *是否使用了加密 
		 * @return 
		 * 
		 */		
		public function get useEncrypt():Boolean{
			return this._useEncrypt;
		}
		/**
		 *是否加密 
		 * @param value
		 * 
		 */		
		public function set useEncrypt(value:Boolean):void{
			this._useEncrypt = value;
		}
		
		/**
		 *注册回调 
		 * @param actionName	方法名
		 * @param callBack		回调
		 * @param week			弱引用
		 * 
		 */		
		public function regCallback(actionName:String,callBack:Function,week:Boolean=true):void
		{
			this.addEventListener(actionName, callBack, false, 0, week);	
		}
		
		/**
		 * 发送消息
		 * @param actionName	名称
		 * @param callBack		回调体
		 * @param _args			发送参数
		 * 
		 */		
		public function sendMessage(actionName:String,callBack:SocketCallback,... _args):void
		{
			if(!this.connected())
			{
				trace("服务器断开了!");
				return;
			}
			
			
		}
		
		/**
		 * 是否为链状态
		 * @return 
		 * 
		 */		
		public function connected():Boolean{
			return this._socket.connected;
		}
		
		/**
		 *关闭 
		 * 
		 */		
		public function close():void{
			this.token = "0";
			this._socket.close();
		}
		
		private function initEventDispatcher():void
		{
			this._eventDispatcher = new EventDispatcher(this);
		}
		
		private function initCallBackDic():void
		{
			this._callbackParamDic = new Dictionary();
		}
		
		private function initSocket():void
		{
			this._socket = new Socket();
			this._socket.endian = Endian.BIG_ENDIAN;
			this._socket.addEventListener(Event.CLOSE, this.onClose);
			this._socket.addEventListener(Event.CONNECT, this.onConnect);
			this._socket.addEventListener(IOErrorEvent.IO_ERROR, this.onError);
			this._socket.addEventListener(ProgressEvent.SOCKET_DATA, this.onData);
			this._socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
		}
		
		private function onClose(e:Event):void
		{
			if(this.onCloseCallback!=null)
			{
				this.onCloseCallback(e);
			}else{
				this.defaultOnClose(e);
			}
			this.token = "0";
		}
		
		private function defaultOnClose(e:Event):void{
			this.dispatchEvent(e);
		}
		
		private function onConnect(e:Event):void
		{
			this.dispatchEvent(e);
		}
		
		private function onError(e:IOErrorEvent):void
		{
			
		}
		
		private function onData(e:ProgressEvent):void
		{
			
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			
		}
	}
}