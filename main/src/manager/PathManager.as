package manager
{
	import consts.PathConst;

	public class PathManager
	{
		private static var _instance:PathManager;
		
		public function PathManager()
		{
		}
		
		public static function getInstance():PathManager
		{
			if(_instance==null)
			{
				_instance = new PathManager();
			}
			return _instance
		}
		
		//获取xml路径
		public function get xmlPath():String{
			return PathConst.pathXML;
		}
		//获取csv路径
		public function get csvPath():String
		{
			return PathConst.pathCSV;
		}
		//获取aiAction路径
		public function get aiActionPath():String
		{
			return PathConst.pathAis;
		}
		//获取角色动作模型
		public function get editedPath():String
		{
			return PathConst.pathEdited;
		}
		
		//获取加载背景图路径
		public function get loadingImgPath():String
		{
			return PathConst.pathLoadingImg;
		}
		
		public function get modulePath():String{
			return  PathConst.pathModule;
		}
	}
}