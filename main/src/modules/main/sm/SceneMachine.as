package modules.main.sm
{
	import consts.PannelName;
	import consts.SceneConst;
	import consts.nots.MainNote;
	
	import gamedata.GlobalVars;
	import gamedata.Relation;
	
	import observer.LDispatch;
	import observer.Notification;
	
	import vos.ChangeSceneDTO;

	public class SceneMachine
	{
		private static var _instance:SceneMachine;
		private var _csdto:ChangeSceneDTO;
		public function SceneMachine()
		{
		}
		
		public static function getInstance():SceneMachine
		{
			if(_instance == null)
			{
				_instance = new SceneMachine();
			}
			
			return _instance;
		}
		
		public function addEventListeners():void
		{
			LDispatch.addListener(MainNote.SWITCH_SCENE, this.switchScene);
		}
		
		private function switchScene(notic:Notification):void
		{
			if(notic.data)
			{
				this._csdto = notic.data as ChangeSceneDTO;
			}else{
				this._csdto = null;
			}
			
			if(this._csdto == null)
			{
				throw(new Error("_csdto为空"));
			}
			
			switch(this._csdto.gotoSceneId)
			{
				case SceneConst.townScene:
					this._csdto.gotoSceneName = PannelName.fsTown;
					break;
			}
			
			GlobalVars.sceneId = this._csdto.gotoSceneId;
			var relationList:Array = (Relation.getInstance().sceneRelation[this._csdto.gotoSceneId] as Array).slice();
			relationList.push(this._csdto);
			LDispatch.dispatch(MainNote.SWITCH_OPEN, relationList);
		}
		
		public function get csdto():ChangeSceneDTO{
			return this._csdto;
		}
	}
}