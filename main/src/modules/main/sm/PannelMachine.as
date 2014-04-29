package modules.main.sm
{
	import consts.nots.MainNote;
	
	import flash.utils.Dictionary;
	
	import gamedata.Relation;
	
	import manager.ModuleManager;
	
	import observer.LDispatch;
	import observer.Notification;
	
	import vos.ChangeSceneDTO;
	import vos.LoaderDTO;

	public class PannelMachine
	{
		private static var _instance:PannelMachine;
		
		private var curScenePannel:Dictionary;
		private var curPopPannel:Dictionary;
		private var loadModulePannel:Array;
		public function PannelMachine()
		{
			this.curScenePannel = new Dictionary();
			this.curPopPannel = new Dictionary();
			this.loadModulePannel = [];
		}
		
		public static function getInstance():PannelMachine
		{
			if(_instance == null)
			{
				_instance = new PannelMachine();
			}
			
			return _instance;
		}
		
		public function addEventListeners():void
		{
			LDispatch.addListener(MainNote.SWITCH_OPEN,this.switchOpen);
		}
		
		private function switchOpen(notic:Notification):void
		{
			this.clearAllPannel();
			var pannelList:Array = notic.data as Array;
			var pannelLen:int = pannelList.length;
			var pannelName:String;
			var moduleName:String;
			var moduleList:Array = [];
			var loaderDTOList:Vector.<LoaderDTO>;
			if(pannelList == null || pannelList.length == 0 )
			{
				throw(new Error("arr 没有数据"));
			}
			var index:int = 0;
			while(index < pannelLen)
			{
				if(pannelList[index] is ChangeSceneDTO)
				{
					pannelName = pannelList[index].gotoSceneName;
					this.loadModulePannel.push(pannelList[index]);
				}else{
					pannelName = pannelList[index];
					this.loadModulePannel.push(pannelName);
				}
				
				moduleName = Relation.getInstance().getModuleNameByPannel(pannelName);
				if(moduleName && moduleList.indexOf(moduleName) == -1 )
				{
					moduleList.push(moduleName);
				}
				index++;
			}
			
			var moduleLen:uint = moduleList.length;
			index = 0;
			while(index < moduleLen)
			{
				loaderDTOList = ModuleManager.getInstance().hasModule(moduleList[index]);
				
				index++;
			}
			
		}
		
		private function clearAllPannel():void
		{
			
		}
	}
}