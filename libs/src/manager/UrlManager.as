package manager
{
	import consts.SuffixConst;

	public class UrlManager
	{
		private static var _instance:UrlManager;
		public function UrlManager()
		{
		}
		
		public static function getInstance():UrlManager
		{
			if(_instance == null)
			{
				_instance = new UrlManager();
			}
			return _instance;
		}
		
		public function getLoadingImgUrl(name:String):String
		{
			return PathManager.getInstance().loadingImgPath + name + "_img" + SuffixConst.SUF_JPEG;
		}
	}
}