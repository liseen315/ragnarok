package
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	import gameinterfaces.IApp;
	
	[SWF(width="1440", height="660", backgroundColor="#000000",frameRate="30")]
	
	public class loading extends Sprite
	{
		private var _loadingMC:LoadingIcon;
		private var _url:URLLoader;
		private var _loader:Loader;
		private var _context:LoaderContext;
		private var _xmlList:Vector.<String>;
		public function loading()
		{
			this.init();
		}
		//初始化		
		private function init():void
		{
			this._context = new LoaderContext();
			this._context.applicationDomain = loaderInfo.applicationDomain;
			this.addLoadingMC();
			this.loadTipsXML()
		}
		//添加LoadingMc
		private function addLoadingMC():void
		{
			this._loadingMC = new LoadingIcon();
			this.addChild(this._loadingMC)
			this._loadingMC.x = stage.stageWidth >> 1;
			this._loadingMC.y = stage.stageHeight >> 1;
		}
		//loadtips
		private function loadTipsXML():void
		{
			this._url = new URLLoader();
			this._url.addEventListener(Event.COMPLETE,onXMLLoadedHandler);
			this._url.load(new URLRequest("loadingTips.xml"));
		}
		
		private function onXMLLoadedHandler(e:Event):void
		{
			this._url.removeEventListener(Event.COMPLETE,onXMLLoadedHandler);
			var xmlData:XML = XML(e.target.data);
			this._url.close();
			this._url = null;
			this._xmlList = new Vector.<String>();
			
			var tlist:XMLList = xmlData.txt;
			var textLen:int = tlist.length();
			var index:int;
			while (index < textLen) {
				this._xmlList.push(tlist[textLen]);
				index++;
			}
			
			this.loadMain();
		}
		
		private function loadMain():void
		{
			this._loader = new Loader();
			this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onMainLoadedHandler);
			this._loader.load(new URLRequest("Main.swf"),this._context);
		}
		
		private function onMainLoadedHandler(e:Event):void
		{
			(e.target as LoaderInfo).removeEventListener(Event.COMPLETE,onMainLoadedHandler);
			var mainApp:IApp = e.target.content as IApp;
			this.addChild(mainApp as Sprite);
		}
	}
}