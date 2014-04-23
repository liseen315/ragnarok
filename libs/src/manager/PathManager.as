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
		
		public function get loadingImgPath():String
		{
			return PathConst.pathLoadingImg;
		}
	}
}