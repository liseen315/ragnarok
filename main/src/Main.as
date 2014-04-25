package
{
	import consts.ModuleName;
	
	import core.App;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import gamedata.GlobalVars;
	
	import gameinterfaces.IApp;
	
	import manager.LayerManager;
	import manager.ModuleManager;
	
	import modules.main.MainModule;
	
	public class Main extends App implements IApp
	{
		private var _params:Object;
		public function Main()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAddToStageHandler);
		}

		private function onAddToStageHandler(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddToStageHandler);
			GlobalVars.context = new LoaderContext();
			GlobalVars.context.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
			GlobalVars.stageW = stage.stageWidth;
			GlobalVars.stageH = stage.stageHeight;
			GlobalVars.host = "124.202.133.137";
			GlobalVars.port = 12007;
			this.regNot();
			this.startUp()
		}
		
		//设置LoaderContext
		public function set context(context:LoaderContext):void
		{
			GlobalVars.context = context;
		}
		
		public function set params(parames:Object):void
		{
			this._params = parames
		}
		
		public function set loadingtxt(textList:Vector.<String>):void
		{
			GlobalVars.loadingtxt = textList;
		}
		
		//启动
		private function startUp():void
		{
			var develop:Developer = new Developer();
			//布置显示层
			LayerManager.getInstance().initLayers(this);
			this.setStageProperty();
			ModuleManager.getInstance().saveAndRun(ModuleName.MainModule,new MainModule());
		}
	}
}