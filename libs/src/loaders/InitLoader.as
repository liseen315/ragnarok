package loaders
{
	import br.com.stimuli.loading.BulkLoader;
	
	import consts.nots.LoaderNote;
	
	import flash.events.Event;
	
	import manager.UrlManager;
	import manager.XmlManager;
	
	import observer.LDispatch;
	import observer.Notification;

	/**
	 *初始化Loader 
	 * @author Administrator
	 * 
	 */	
	public class InitLoader extends CoreLoader
	{
		private const NAME:String = "init_loader_name";
		private const AI_NAME:String = "ActionAI";
		public function InitLoader()
		{
			super(NAME);
			this.addListeners();
		}
		
		private function addListeners():void
		{
			LDispatch.addListener(LoaderNote.LOAD_INIT,this.loadData);
		}
		
		private function removeListeners():void
		{
			LDispatch.removeListener(LoaderNote.LOAD_INIT,this.loadData);
		}
		
		override protected function loadData(notic:Notification):void{
			this.loadXMLData();
			loader.start();
		}
		
		private function loadXMLData():void
		{
			var fileName:String;
			var filePath:String;
			var loadObj:Object
			var list:Array = XmlManager.getInstance().xmlNameList;
			var listLen:int = list.length;
			var index:int;
			while(index < listLen)
			{
				fileName = list[index];
				filePath = UrlManager.getInstance().getXmlUrl(fileName);
				loadObj = {
					id:fileName,
					maxTries:1
				}
				loader.add(filePath, loadObj).addEventListener(BulkLoader.COMPLETE, this.singleXmlHandler);
				index = index + 1;
			}
		}
		
		private function singleXmlHandler(e:Event):void
		{
			var id:String = e.target.id;
			loader.get(id).removeEventListener(BulkLoader.COMPLETE, this.singleXmlHandler);
			this.saveXML(id,new XML(e.target.loader.data));
		}
		
		private function saveXML(xmlName:String,data:XML):void
		{
			XmlManager.getInstance().saveXML(xmlName,data);
		}
	}
}