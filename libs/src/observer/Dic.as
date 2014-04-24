package observer
{
	import flash.utils.Dictionary;

	public class Dic
	{
		private var _dic:Dictionary;
		public function Dic()
		{
			
		}
		
		public function handle(notic:Notification):void{
			this.handleCallback(this._dic, notic);
		}
		
		private function handleCallback(dic:Dictionary,notic:Notification):void
		{
			var fun:*;
			for (fun in dic) {
				fun(notic);
			}
		}
		
		public function regHandler(fun:Function):void{
			if(this.dic[fun])
			{
				return;
			}
			var dic:Dictionary = this.dic;
			dic[fun] = 1;
		}
		
		public function get dic():Dictionary
		{
			if(this._dic==null)
			{
				this._dic = new Dictionary();
			}
			return this._dic; 
		}
		
		public function hasHandler(callBack:Function):Boolean{
			return this.dic[callBack];
		}
		
		public function removeHandler(type:String,callBack:Function):void{
			delete this.dic[callBack];
		}
	}
}