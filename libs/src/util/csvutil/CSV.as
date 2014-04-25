package util.csvutil {
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
    public dynamic class CSV extends Proxy {

        private var _csvArr:Array;
        private var _keyEntry:int;
        private var _name:String;

        public function CSV(_arg1:String, _arg2:String, _arg3:Boolean=false){
            this._name = _arg2;
            this.init(_arg1, _arg3);
        }
        public function get name():String{
            return (this._name);
        }
        private function init(_arg1:String, _arg2:Boolean=false):void{
            this._csvArr = CSVComplex.parse2(_arg1, _arg2);
        }
        public function listKeys():Array{
            return (this._csvArr[this._keyEntry]);
        }
        public function setKeyEntry(_arg1:int):void{
            this._keyEntry = _arg1;
        }
        public function deleteEntriesByIndex(_arg1:*, _arg2:*=4294967295):void{
            var _local3:Array = this._csvArr.slice(0, _arg1);
            var _local4:Array = this._csvArr.slice(_arg2);
            this._csvArr = this._csvArr.slice(_arg1, _arg2);
        }
        public function deleteEntriesByLength(_arg1:int, _arg2:uint=1):void{
            if (_arg2 == -1){
                this._csvArr.splice(_arg1);
            } else {
                this._csvArr.splice(_arg1, _arg2);
            };
        }
        public function get length():uint{
            return (((this._csvArr.length - this._keyEntry) - 1));
        }
        public function getEntriesByCondition(_arg1:String, _arg2:*):Array{
            var _local3:CSVElement = new CSVElement(this._csvArr[this._keyEntry]);
            var _local4:Array = [];
            var _local5:int = this._csvArr.length;
            var _local6:int = (this._keyEntry + 1);
            while (_local6 < _local5) {
                _local3.valueEntry = this._csvArr[_local6];
                if (_local3[_arg1] == _arg2){
                    _local4.push(_local3.clone());
                };
                _local6++;
            };
            return (_local4);
        }
        public function getAllEntries():Array{
            var _local1:CSVElement = new CSVElement(this._csvArr[this._keyEntry]);
            var _local2:Array = [];
            var _local3:int = this._csvArr.length;
            var _local4:int = (this._keyEntry + 1);
            while (_local4 < _local3) {
                _local1.valueEntry = this._csvArr[_local4];
                _local2.push(_local1.clone());
                _local4++;
            };
            return (_local2);
        }
        public function getIndexByCondition(_arg1:String, _arg2:*):int{
            var _local3:CSVElement = new CSVElement(this._csvArr[this._keyEntry]);
            var _local4:int = this._csvArr.length;
            var _local5:int = (this._keyEntry + 1);
            while (_local5 < _local4) {
                _local3.valueEntry = this._csvArr[_local5];
                if (_local3[_arg1] == _arg2){
                    return (((_local5 - this._keyEntry) - 1));
                };
                _local5++;
            };
            return (-1);
        }
        public function get csvArr():Array{
            return (this._csvArr);
        }
        override flash_proxy function getProperty(_arg1:*){
            if (!isNaN(parseInt(_arg1))){
                return (new CSVElement(this._csvArr[this._keyEntry], this._csvArr[((parseInt(_arg1) + this._keyEntry) + 1)]));
            };
        }
        override flash_proxy function callProperty(_arg1, ... _args){
            return (null);
        }
        public function toString():String{
            return ("[Class CSV]");
        }

    }
}
