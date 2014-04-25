package manager
{
	import consts.XmlConst;
	
	import flash.utils.Dictionary;

	public class XmlManager
	{
		private static var _instance:XmlManager;
		private var _xmlDic:Dictionary;
		public function XmlManager()
		{
			this._xmlDic = new Dictionary();
		}
		
		public static function getInstance():XmlManager
		{
			if(_instance == null)
			{
				_instance = new XmlManager();
			}
			return _instance;
		}
		/**
		 *保存xml数据到管理器 
		 * @param name		xml名->key
		 * @param dataValue	XML数据
		 * 
		 */		
		public function saveXML(name:String,dataValue:XML):void
		{
			this._xmlDic[name] = dataValue;
		}
		
		//获取xml名称列表
		public function get xmlNameList():Array
		{
			return [XmlConst.module, XmlConst.map, XmlConst.itemconfig, XmlConst.talk, XmlConst.script, XmlConst.guide, XmlConst.gemsIntro, XmlConst.vipLayout, XmlConst.storyScript];
		}
		//获取压缩后的
		public function get ziplist():Array{
			return [XmlConst.xd];
		}
	}
}