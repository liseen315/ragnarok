package loaders
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;

	public class CoreLoader
	{
		protected var loader:BulkLoader;
		public function CoreLoader(name:String,num:int = 12)
		{
			this.loader = new BulkLoader(name,num);
			this.loader.addEventListener(BulkProgressEvent.COMPLETE, this.completeHandler);
		}
		
		protected function completeHandler(e:BulkProgressEvent):void{
		}
	}
}