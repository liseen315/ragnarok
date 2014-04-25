//Created by Action Script Viewer - http://www.buraks.com/asv
package util.csvutil {
    import util.csvutil.*;
    import flash.utils.*;
	
    dynamic class CSVElement extends Proxy {

        private var _keyEntey:Array;
        private var _valueEntry:Array;

        public function CSVElement(_arg1:Array=null, _arg2:Array=null){
            this._keyEntey = _arg1;
            this._valueEntry = _arg2;
        }
        function get keyEntey():Array{
            return (this._keyEntey);
        }
        function set keyEntey(_arg1:Array):void{
            this._keyEntey = _arg1;
        }
        function get valueEntry():Array{
            return (this._valueEntry);
        }
        function set valueEntry(_arg1:Array):void{
            this._valueEntry = _arg1;
        }
        function clone():CSVElement{
            return (new CSVElement(this._keyEntey, this._valueEntry));
        }
        override flash_proxy function getProperty(_arg1){
            var _local2:int;
            if (!isNaN(parseInt(_arg1))){
                return (this._valueEntry[int(_arg1)]);
            };
            _local2 = this._keyEntey.indexOf(_arg1.localName);
            if (_local2 != -1){
                return (this._valueEntry[_local2]);
            };
        }
        override flash_proxy function callProperty(_arg1, ... _args){
            return (null);
        }
        public function toString():String{
            return ("[Class CSVElement]");
        }

    }
}//package util.csvutil 
