package net
{
	/**
	 *网络回调包装器 
	 * @author Administrator
	 * 
	 */	
	public class SocketCallback
	{
		private var _callbackName:String;
		private var _callbackParameters:Array;
		
		/**
		 *回调构造 
		 * @param callBackName	回调名
		 * @param callBackPar	回调参数列表
		 * 
		 */		
		public function SocketCallback(callBackName:String,callBackPar:Array=null)
		{
			this._callbackName = callBackName;
			this._callbackParameters = callBackPar;
		}
		/**
		 *获取回调名 
		 * @return 
		 * 
		 */		
		public function get callbackName():String
		{
			return this._callbackName;
		}
		
		/**
		 *获取回调参数列表 
		 * @return 
		 * 
		 */		
		public function get callbackParameters():Array
		{
			return this._callbackParameters;
		}
	}
}