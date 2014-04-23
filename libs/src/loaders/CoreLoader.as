package loaders
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import vos.LoaderDTO;

	public class CoreLoader
	{
		protected var loader:BulkLoader;
		public function CoreLoader(name:String,retryNum:int = 12)
		{
			this.loader = new BulkLoader(name,retryNum);
			this.loader.addEventListener(BulkProgressEvent.COMPLETE, this.completeHandler);
		}
		
		protected function completeHandler(e:BulkProgressEvent):void{
		}
		
		protected function doData(id:String, lDTO:LoaderDTO):void
		{
			
		}
	}
}