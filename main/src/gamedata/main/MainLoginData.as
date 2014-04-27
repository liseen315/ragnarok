package gamedata.main
{
	import consts.NetConst;
	
	import flash.events.Event;
	
	import gamedata.GlobalVars;
	
	import net.BabelTimeSocket;
	import net.SocketCallback;

	public class MainLoginData
	{
		private static var _instance:MainLoginData;
		
		private var _callBack:Function;
		public function MainLoginData()
		{
		}
		
		public static function getInstance():MainLoginData
		{
			if(_instance == null)
			{
				_instance = new MainLoginData();
			}
			
			return _instance;
		}
		
		/**
		 *连接服务器 
		 * @param callBack
		 * 
		 */		
		public function login(callBack:Function=null):void
		{
			this._callBack = callBack;
			BabelTimeSocket.getInstance().addEventListener(Event.CONNECT, this.connected);
			BabelTimeSocket.getInstance().connect(GlobalVars.host,GlobalVars.port);
		}
		
		private function connected(e:Event):void
		{
			trace("connected");
			BabelTimeSocket.getInstance().removeEventListener(Event.CONNECT, this.connected);
			BabelTimeSocket.getInstance().useEncrypt = true;
			var callBack:SocketCallback = new SocketCallback(NetConst.RE_LOGIN);
			BabelTimeSocket.getInstance().regCallback(NetConst.RE_LOGIN,this.loginHandler);
			BabelTimeSocket.getInstance().sendMessage(NetConst.CS_LOGIN, callBack, GlobalVars.param);
		}
		
		private function loginHandler():void
		{
			
		}
	}
}