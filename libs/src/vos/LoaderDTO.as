package vos
{
	import flash.system.LoaderContext;

	public class LoaderDTO
	{
		
		public var id:String;
		public var url:String;
		public var callbackNote:String;
		public var callErrorNote:String;
		public var callProgressNote:String;
		public var callbackParam:Object;
		public var context:LoaderContext;
		public var isloop:Boolean = false;
		public var totReload:int = 10;
		public var reloadDelay:int = 5000;
		
		public function LoaderDTO()
		{
		}
	}
}