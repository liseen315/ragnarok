package vos
{
	public class ChangeSceneDTO
	{
		public var gotoSceneId:int;
		public var gotoSceneName:String;
		public var sceneData:Object;
		public var showloading:Boolean = true;
		public var loadingData:Object;

		public function ChangeSceneDTO(id:int,data:Object=null, loading:Boolean=true)
		{
			this.gotoSceneId = id;
			this.sceneData = data;
			this.showloading = loading;
		}
	}
}