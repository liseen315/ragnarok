package manager
{
	import flash.utils.Dictionary;
	
	import gameinterfaces.IModule;

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
	}
}