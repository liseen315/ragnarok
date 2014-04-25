package gamedata
{
	import flash.system.LoaderContext;
	
	/**
	 *全局变量 
	 * @author Administrator
	 * 
	 */	
	public class GlobalVars
	{
		public static var loadingtxt:Vector.<String>;
		public static var stageW:int;
		public static var stageH:int;
		public static var context:LoaderContext;
		public static var host:String = "";
		public static var port:int = -1;
		
		public static var param:Object = {};
		public function GlobalVars()
		{
		}
	}
}