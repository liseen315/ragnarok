package loaders
{
	import br.com.stimuli.loading.BulkLoader;
	
	import consts.CsvConst;
	import consts.nots.LoaderNote;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import manager.CSVManager;
	import manager.UrlManager;
	import manager.XmlManager;
	
	import observer.LDispatch;
	import observer.Notification;
	
	import util.csvutil.CSV;

	/**
	 *初始化Loader 主要用于加载系统xml数据
	 * 系统配置表
	 * AIData
	 * 以及角色动作模型数据
	 * @author Administrator
	 * 
	 */	
	public class InitLoader extends CoreLoader
	{
		private const NAME:String = "init_loader_name";
		private const AI_NAME:String = "ActionAI";
		private const BABEL_NAME:String = "ed";
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
			//在手机版内可以不适用这种数据格式文件.
			this.loadCSVData();
			this.loadAIData();
			this.loadBabelData();
			loader.start();
			addTimer();
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
		
		private function loadCSVData():void
		{
			var fileName:String;
			var filePath:String;
			var loadObj:Object;
			var csvList:Array = CSVManager.getInstance().list;
			var csvListLen:int = csvList.length;
			var index:int = 0;
			while(index < csvListLen)
			{
				fileName = csvList[index];
				filePath = UrlManager.getInstance().getCSVUrl(fileName);
				loadObj = {
					id:fileName,
					maxTries:1
				}
				loader.add(filePath,loadObj).addEventListener(BulkLoader.COMPLETE, this.singleCsvHandler);
				index = index + 1
			}
		}
		
		private function singleCsvHandler(e:Event):void
		{
			var id:String = e.target.id;
			loader.get(id).removeEventListener(BulkLoader.COMPLETE, this.singleCsvHandler);
			this.saveCSV(id,new CSV(String(e.target.loader.data),id,this.isColumnCsv(id)));
		}
		
		private function isColumnCsv(name:String):Boolean
		{
			var tempValue:Boolean = false;
			if(name.indexOf(CsvConst.COLUMN_SIGN) >= 0)
			{
				tempValue = true;
			}
			return tempValue;
		}
		
		private function saveCSV(csvName:String,csvData:CSV):void
		{
			CSVManager.getInstance().saveCSV(csvName,csvData);
		}
		
		private function loadAIData():void
		{
			var aiPath:String = UrlManager.getInstance().getAIActionUrl(this.AI_NAME);
			var loadObj:Object = {
				id:this.AI_NAME,
				maxTries:1,
				type:BulkLoader.TYPE_BINARY
			}
			loader.add(aiPath, loadObj).addEventListener(BulkLoader.COMPLETE, this.singleAiHandler);
		}
		
		private function singleAiHandler(e:Event):void
		{
			var id:String = e.target.id;
			loader.get(id).removeEventListener(BulkLoader.COMPLETE, this.singleAiHandler);
			var aiData:ByteArray = ByteArray(e.target.loader.data);
			aiData.uncompress();
			LDispatch.dispatch(LoaderNote.INIT_AI_LOADED,aiData);
		}
		
		private function loadBabelData():void
		{
			var babelPath:String = UrlManager.getInstance().getBabelZipUrl(BABEL_NAME);
			var loadObj:Object = {
				id:babelPath,
				maxTries:1
			}
			loader.add(babelPath, loadObj).addEventListener(BulkLoader.COMPLETE, this.singleBabelHandler);
		}
		
		private function singleBabelHandler(e:Event):void
		{
			var id:String = e.target.id;
			loader.get(id).removeEventListener(BulkLoader.COMPLETE, this.singleBabelHandler);
		}
		
		//当基础配置数据全部加载完毕后通知主中介者
		override protected function allLoaded():void
		{
			super.allLoaded();
			LDispatch.dispatch(LoaderNote.INIT_LOADED);
		}
	}
}