package manager
{
	import core.App;
	
	import flash.display.Stage;
	
	import game.layers.AlertLayer;
	import game.layers.BgLayer;
	import game.layers.ConsoleLayer;
	import game.layers.FightLayer;
	import game.layers.FullPopLayer;
	import game.layers.GuideLayer;
	import game.layers.LoadingLayer;
	import game.layers.MarqueeLayer;
	import game.layers.MenuLayer;
	import game.layers.MiddleMenuLayer;
	import game.layers.PopLayer;
	import game.layers.SceneLayer;
	import game.layers.ScenepannelLayer;
	import game.layers.SystemLayer;
	import game.layers.TipLayer;
	import game.layers.TipsMenuLayer;
	import game.layers.TopLayer;

	/**
	 *层级管理器 
	 * @author Administrator
	 * 
	 */	
	public class LayerManager
	{
		private static var _instance:LayerManager;
		
		public var _root:App;
		public var _stage:Stage;
		public var _bg:BgLayer;
		public var _scene:SceneLayer;
		public var _scenepannel:ScenepannelLayer;
		public var _fight:FightLayer;
		private var _guide:GuideLayer;
		public var _menu:MenuLayer;
		public var _middleMenu:MiddleMenuLayer;
		public var _guideUnderPop:GuideLayer;
		public var _fullpop:FullPopLayer;
		public var _pop:PopLayer;
		public var _alert:AlertLayer;
		public var _tipsMenu:TipsMenuLayer;
		public var _marquee:MarqueeLayer;
		public var _tip:TipLayer;
		public var _loading:LoadingLayer;
		public var _console:ConsoleLayer;
		public var _system:SystemLayer;
		public var _top:TopLayer;
		
		public function LayerManager()
		{
		}
		
		public static function getInstance():LayerManager
		{
			if(_instance == null)
			{
				_instance = new LayerManager();	
			}
			
			return _instance;
		}
		/**
		 *初始化层 
		 * @param root	跟
		 * 
		 */		
		public function initLayers(root:App):void
		{
			this._root = root;
			this._stage = root.stage;
			this._bg = new BgLayer();
			this._scene = new SceneLayer();
			this._scenepannel = new ScenepannelLayer();
			this._fight = new FightLayer();
			this._menu = new MenuLayer();
			this._middleMenu = new MiddleMenuLayer();
			this._guideUnderPop = new GuideLayer();
			this._fullpop = new FullPopLayer();
			this._pop = new PopLayer();
			this._alert = new AlertLayer();
			this._tipsMenu = new TipsMenuLayer();
			this._marquee = new MarqueeLayer();
			this._guide = new GuideLayer();
			this._tip = new TipLayer();
			this._loading = new LoadingLayer();
			this._console = new ConsoleLayer();
			this._system = new SystemLayer();
			this._top = new TopLayer();
			
			this._root.addChild(this._bg);
			this._root.addChild(this._scene);
			this._root.addChild(this._scenepannel);
			this._root.addChild(this._fight);
			this._root.addChild(this._menu);
			this._root.addChild(this._middleMenu);
			this._root.addChild(this._guideUnderPop);
			this._root.addChild(this._fullpop);
			this._root.addChild(this._pop);
			this._root.addChild(this._alert);
			this._root.addChild(this._tipsMenu);
			this._root.addChild(this._marquee);
			this._root.addChild(this._guide);
			this._root.addChild(this._tip);
			this._root.addChild(this._loading);
			this._root.addChild(this._console);
			this._root.addChild(this._system);
			this._root.addChild(this._top);
		}
	}
}