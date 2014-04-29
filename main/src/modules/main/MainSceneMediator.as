package modules.main
{
	import core.Mediator;
	
	import modules.main.sm.PannelMachine;
	import modules.main.sm.SceneMachine;
	
	public class MainSceneMediator extends Mediator
	{
		public function MainSceneMediator()
		{
			super();
			this.init();
		}
		
		private function init():void
		{
			SceneMachine.getInstance().addEventListeners();
			PannelMachine.getInstance().addEventListeners();
		}
	}
}