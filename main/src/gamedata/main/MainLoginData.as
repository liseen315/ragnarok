package gamedata.main
{
	import consts.NetConst;
	import consts.SceneConst;
	import consts.nots.MainNote;
	
	import flash.events.Event;
	
	import gamedata.GlobalVars;
	
	import net.BabelTimeSocket;
	import net.SocketCallback;
	
	import observer.LDispatch;
	
	import vos.ChangeSceneDTO;

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
//			BabelTimeSocket.getInstance().addEventListener(Event.CONNECT, this.connected);
//			BabelTimeSocket.getInstance().connect(GlobalVars.host,GlobalVars.port);
			
			this.connected(null);
		}
		
		private function connected(e:Event):void
		{
			trace("connected当前由于无法了登陆游戏服务器所以直接进行登录后的逻辑");
			BabelTimeSocket.getInstance().removeEventListener(Event.CONNECT, this.connected);
			this.loginHandler();
			/*BabelTimeSocket.getInstance().useEncrypt = true;
			var callBack:SocketCallback = new SocketCallback(NetConst.RE_LOGIN);
			BabelTimeSocket.getInstance().regCallback(NetConst.RE_LOGIN,this.loginHandler);
			BabelTimeSocket.getInstance().sendMessage(NetConst.CS_LOGIN, callBack, GlobalVars.param);*/
		}
		
		private function loginHandler():void
		{
			LDispatch.dispatch(MainNote.SWITCH_SCENE,new ChangeSceneDTO(SceneConst.townScene));
		}
	}
}