package net
{
	import com.hurlant.crypto.hash.MD5;
	import com.hurlant.crypto.symmetric.CBCMode;
	import com.hurlant.crypto.symmetric.DESKey;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;

	/**
	 *看样子作者很稀饭巴比伦啊 
	 * @author Administrator
	 * 
	 */	
	public class BabelTimeSocket implements IEventDispatcher
	{
		
		private static const TOKEN_HISTORY_LENGTH:int = 10;
		private static const HEAD_LENGTH:uint = 8;
		private static const BODY_LENGTH:uint = 4;
		private static const ENCRYPT_LENGTH:uint = 16;
		private static const STATUS_PARSEHEAD:String = "statusparsehead";
		private static const STATUS_PARSEBODY:String = "statusparsebody";
		private static const STATUS_PARSEENCRYPT:String = "statusparseencrypt";
		
		private static var _instance:BabelTimeSocket;
		
		private var _eventDispatcher:IEventDispatcher;
		private var _callbackParamDic:Dictionary;
		private var _socket:Socket;
		private var _host:String;
		private var _port:int;
		private var _useEncrypt:Boolean;
		private var token:String = "0";//标记
		private var _currentParseStatus:String;//当前解析状态，解析头，解析Body
		private var _des:DESKey;
		private var _cbc:CBCMode;
		private var _md5:MD5;
		
		public var onCloseCallback:Function;
		public function BabelTimeSocket()
		{
			this.initEventDispatcher();
			this.initCallBackDic();
			this.initSocket();
			this.initStatus();
			this.initDes();
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
			var randomSeed:uint;
			var message:ByteArray = new ByteArray();
			message.objectEncoding = this._socket.objectEncoding;
			message.endian = Endian.BIG_ENDIAN;
			var value:Object = {};
			value.method = actionName;
			value.callback = {};
			value.callback.callbackName = callBack.callbackName;
			value.type = 1;
			value.token = this.token;
			if (callBack.callbackParameters){
				randomSeed = this.getRandomCallbackParamID();
				value.callback.callbackParameID = randomSeed;
				this._callbackParamDic[randomSeed] = callBack.callbackParameters;
			}
			value.args = _args;
			message.writeObject(value);
			var random:Number = Math.random();
			var IV:ByteArray = new ByteArray();
			IV.writeDouble(random);
			this.setIV(IV);
			if (this._useEncrypt){
				this.encrypt(message);
			}
			this._socket.writeUnsignedInt(message.length + 8);
			this._socket.writeBoolean(this._useEncrypt);
			this._socket.writeByte(0);
			this._socket.writeShort(0);
			this._socket.writeBytes(IV);
			this._socket.writeBytes(message);
			message.clear();
			this._socket.flush();
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
			if(this._socket.connected)
			{
				this.parseData();
			}
		}
		
		private function parseData():void
		{
			
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			
		}
		
		private function initStatus():void
		{
			this._currentParseStatus = STATUS_PARSEHEAD;
		}
		
		//生成加密库
		private function initDes():void
		{
			var key:ByteArray = new ByteArray();
			key.writeUTFBytes("spclxoZFwyeApdvkbBmQlCvV");
			this._des = new DESKey(key);
			var IV:ByteArray = new ByteArray();
			IV.writeUTFBytes("JjELjULcUA");
			this._cbc = new CBCMode(this._des);
			this._cbc.IV = IV;
			this._md5 = new MD5();
		}
		
		private function setIV(ivValue:ByteArray):void
		{
			this._cbc.IV = ivValue;
		}
		
		private function encrypt(value:ByteArray):void
		{
			this._cbc.encrypt(value);
		}
		
		private function decrypt(value:ByteArray):void
		{
			this._cbc.decrypt(value);
		}
		
		private function getRandomCallbackParamID():uint{
			var randomSeed:uint = (uint.MAX_VALUE * Math.random());
			if (this._callbackParamDic[randomSeed]){
				return (this.getRandomCallbackParamID());
			}
			return randomSeed;
		}
	}
}