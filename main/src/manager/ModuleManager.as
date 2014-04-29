package manager
{
	import consts.SuffixConst;
	import consts.XmlConst;
	
	import flash.utils.Dictionary;
	
	import gamedata.GlobalVars;
	
	import gameinterfaces.IModule;
	
	import vos.LoaderDTO;

	/**
	 *模块管理器 
	 * @author Administrator
	 * 
	 */	
	public class ModuleManager
	{
		private static var _instance:ModuleManager;
		
		private var _moduleDic:Dictionary;
		public function ModuleManager()
		{
			this._moduleDic = new Dictionary();
		}
		
		public static function getInstance():ModuleManager
		{
			if(_instance == null )
			{
				_instance = new ModuleManager();
			}
			return _instance;
		}
		
		public function saveModule(name:String,module:IModule):void
		{
			this._moduleDic[name] = module;
		}
		
		public function saveAndRun(name:String,module:IModule):void
		{
			this.saveModule(name,module);
			module.register();
		}
		
		/**
		 *是否有对应的Module模块 
		 * @param moduleName
		 * @return 
		 * 
		 */		
		public function hasModule(moduleName:String):Vector.<LoaderDTO>
		{
			trace("hasModule-----------------",moduleName);
			if(moduleName == null)
			{
				return null;
			}
			var loaderDTOList:Vector.<LoaderDTO> = new Vector.<LoaderDTO>;
			var xmlList:XMLList = XmlManager.getInstance().getXML(XmlConst.module).module;
			
			var listLen:int = xmlList.length();
			var tempLoaderDTO:LoaderDTO = new LoaderDTO();
			tempLoaderDTO.id = moduleName;
			tempLoaderDTO.url = UrlManager.getInstance().getModuleUrl(moduleName);
			tempLoaderDTO.callbackParam = {fix:SuffixConst.SUF_SWF};
			tempLoaderDTO.context = GlobalVars.context;
			
			if (!this._moduleDic[moduleName]){
				loaderDTOList.push(tempLoaderDTO);
			}
			var i:int = 0;
			var resXMLList:XMLList;
			var resLen:int;
			var j:int = 0;
			var resLoaderDTO:LoaderDTO;
			var path:String;
			while(i<listLen)
			{
				if(xmlList[i].@name == moduleName)
				{
					resXMLList = xmlList[i].res.resUrl;
					resLen = resXMLList.length();
					j = 0;
					while(j<resLen)
					{
						resLoaderDTO = new LoaderDTO();
						path = xmlList[j].toString();
						trace("@@@@@path-----",path);
						j++;
					}
					break;
				}
				i++;
			}
			
			
			return loaderDTOList
		}
	}
}