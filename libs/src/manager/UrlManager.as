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
		
		//获取xml的路径
		public function getXmlUrl(name:String):String{
			return PathManager.getInstance().xmlPath + name + SuffixConst.SUF_XML;
		}
		
		public function getCSVUrl(name:String):String
		{
			return PathManager.getInstance().csvPath + name + SuffixConst.SUF_CSV;
		}
		
		//获取加载背景的图片路径
		public function getLoadingImgUrl(name:String):String
		{
			return PathManager.getInstance().loadingImgPath + name + "_img" + SuffixConst.SUF_JPEG;
		}
	}
}