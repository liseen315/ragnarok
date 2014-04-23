package modules.main
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.loadingtypes.BinaryItem;
	
	import consts.SuffixConst;
	
	import core.Mediator;
	
	/**
	 *主加载中介 
	 * @author Administrator
	 * 
	 */	
	public class MainLoadMediator extends Mediator
	{
		public function MainLoadMediator()
		{
			super();
			this.init();
		}
		
		private function init():void
		{
			//向加载器内添加新类型
			BulkLoader.registerNewType(SuffixConst.SUF_GATE, BulkLoader.TYPE_BINARY, BinaryItem);
			BulkLoader.registerNewType(SuffixConst.SUF_BV, BulkLoader.TYPE_BINARY, BinaryItem);
			BulkLoader.registerNewType(SuffixConst.SUF_BABEL, BulkLoader.TYPE_BINARY, BinaryItem);
			BulkLoader.registerNewType(SuffixConst.SUF_BEHAVIOR, BulkLoader.TYPE_BINARY, BinaryItem);
			BulkLoader.registerNewType(SuffixConst.SUF_SCENE, BulkLoader.TYPE_BINARY, BinaryItem);
			BulkLoader.registerNewType(SuffixConst.SUF_ZIP, BulkLoader.TYPE_BINARY, BinaryItem);
			BulkLoader.registerNewType(SuffixConst.SUF_TXT, BulkLoader.TYPE_BINARY, BinaryItem);
			BulkLoader.registerNewType(SuffixConst.SUF_SWF, BulkLoader.TYPE_BINARY, BinaryItem);
			
			
		}
	}
}