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
		
		public function getAIActionUrl(name:String):String
		{
			return PathManager.getInstance().aiActionPath + name + SuffixConst.SUF_AI;
		}
		
		public function getBabelZipUrl(name:String):String
		{
			return PathManager.getInstance().editedPath + name + SuffixConst.SUF_TXT;
		}
		//获取加载背景的图片路径
		public function getLoadingImgUrl(name:String):String
		{
			return PathManager.getInstance().loadingImgPath + name + "_img" + SuffixConst.SUF_JPEG;
		}
		
		//获取模块的路径
		public function getModuleUrl(name:String):String{
			return PathManager.getInstance().modulePath + name + SuffixConst.SUF_SWF;
		}
		
		public function getResUrl(value:String):String{
			return  value;
		}
	}
}