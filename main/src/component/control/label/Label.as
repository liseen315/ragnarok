package component.control.label
{
	import component.expand.fonts.TextFormatLib;
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 *文本控件 
	 * @author Administrator
	 * 
	 */	
	public class Label extends TextField
	{
		/**
		 * 
		 * @param tx		文本
		 * @param tformat	文本样式
		 * @param filters	滤镜
		 * 
		 */		
		public function Label(tx:String,tformat:TextFormat = null,filters:Array = null,autoSize:Boolean=true,selectable:Boolean=false)
		{
			super();
			this.autoSize = autoSize ? TextFieldAutoSize.LEFT:TextFieldAutoSize.NONE;
			this.defaultTextFormat = tformat || TextFormatLib.song_FFFFFF_14;
			//滤镜暂时没写
			this.selectable = selectable;
			this.text = tx;
		}
	}
}