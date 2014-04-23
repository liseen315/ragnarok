package gameinterfaces
{
	import flash.events.IEventDispatcher;
	import flash.system.LoaderContext;
	
	public interface IApp extends IEventDispatcher
	{
		function set context(context:LoaderContext):void;
		function set params(parames:Object):void;
		function set loadingtxt(textList:Vector.<String>):void;
	}
}