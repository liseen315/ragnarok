//Created by Action Script Viewer - http://www.buraks.com/asv
package util.csvutil {
    import util.array.*;

    public final class CSVComplex {

        private static const ROW_BEGIN:String = "ROW_BEGIN";
        private static const ROW_END:String = "ROW_END";
        private static const COL_BEGIN:String = "COL_BEGIN";
        private static const COL_END:String = "COL_END";
        private static const COL_IN:String = "COL_IN";
        private static const QUOTE_BEGIN:String = "QUOTE_BEGIN";
        private static const QUOTE_IN:String = "QUOTE_IN";
        private static const QUOTE_END:String = "QUOTE_END";

        private static var _csvArrayData:Array = [];

        public static function parse(_arg1:String=""):Array{
            var _local2:String;
            var _local7:uint;
            var _local8:String;
            if (_arg1 == null){
                throw (new Error("csv为空"));
            };
            clearColumn();
            var _local3:int;
            var _local4:int;
            var _local5 = "";
            _local2 = ROW_BEGIN;
            var _local6:Boolean;
            while (_local7 <= _arg1.length) {
                _local8 = _arg1.charAt(_local7);
                do  {
                    _local6 = false;
                    switch (_local2){
                        case ROW_BEGIN:
                            _local4 = -1;
                            _local2 = COL_BEGIN;
                            _local6 = true;
                            break;
                        case ROW_END:
                            _local3++;
                            _local2 = ROW_BEGIN;
                            break;
                        case COL_BEGIN:
                            _local4++;
                            _local5 = "";
                            if (_local8 == "\""){
                                _local2 = QUOTE_BEGIN;
                            } else {
                                _local2 = COL_IN;
                                _local6 = true;
                            };
                            break;
                        case COL_IN:
                            if ((((_local8 == ",")) || ((_local8 == "\n")))){
                                _local2 = COL_END;
                                _local6 = true;
                            } else {
                                _local5 = (_local5 + _local8);
                            };
                            break;
                        case COL_END:
                            onColumn(_local3, _local4, _local5);
                            if (_local8 == ","){
                                _local2 = COL_BEGIN;
                            } else {
                                if ((((_local8 == "\n")) || ((_local8 == "\r")))){
                                    _local2 = ROW_END;
                                    _local6 = true;
                                };
                            };
                            break;
                        case QUOTE_BEGIN:
                            _local2 = QUOTE_IN;
                            _local6 = true;
                            break;
                        case QUOTE_IN:
                            if (_local8 == "\""){
                                _local2 = QUOTE_END;
                            } else {
                                _local5 = (_local5 + _local8);
                            };
                            break;
                        case QUOTE_END:
                            if (_local8 == "\""){
                                _local5 = (_local5 + _local8);
                                _local2 = QUOTE_IN;
                            } else {
                                _local2 = COL_IN;
                                _local6 = true;
                            };
                            break;
                        default:
                            throw ("impossible");
                    };
                } while (_local6);
                _local7++;
            };
            return (_csvArrayData);
        }
        private static function clearColumn():void{
            var _local2:int;
            var _local3:int;
            var _local1:uint;
            while (_local1 < _csvArrayData.length) {
                _local2 = _csvArrayData[_local1].length;
                _local3 = 0;
                while (_local3 < _local2) {
                    _csvArrayData[_local1].pop();
                    _local3++;
                };
                _csvArrayData[_local1] = null;
                _local1++;
            };
            _csvArrayData = [];
        }
        private static function onColumn(_arg1:int, _arg2:int, _arg3:String):void{
            ((!(_csvArrayData[_arg1])) && ((_csvArrayData[_arg1] = [])));
            ((!(_csvArrayData[_arg1][_arg2])) && ((_csvArrayData[_arg1][_arg2] = [])));
            if (_csvArrayData[_arg1][_arg2]){
                _csvArrayData[_arg1][_arg2] = _arg3;
            };
        }
        public static function parse2(_arg1:String, _arg2:Boolean=false):Array{
            var _local5:String;
            var _local6:int;
            var _local8:int;
            var _local12:Array;
            var _local13:int;
            var _local14:int;
            var _local15:String;
            var _local3:String = String.fromCharCode(1);
            var _local4:String = String.fromCharCode(2);
            _arg1 = _arg1.replace(/""/g, _local3);
            var _local7:Array = _arg1.match(/".*?"/gs);
            _local6 = _local7.length;
            while (_local8 < _local6) {
                _local5 = _local7[_local8];
                _arg1 = _arg1.replace(_local5, _local5.replace(/,/g, _local4));
                _local8++;
            };
            var _local9:Array = _arg1.split("\r\n");
            var _local10:int = _local9.length;
            var _local11:int;
            while (_local11 < _local10) {
                _local12 = (_local9[_local11] = _local9[_local11].split(","));
                _local13 = _local12.length;
                _local14 = 0;
                while (_local14 < _local13) {
                    _local15 = _local12[_local14];
                    if (_local15.indexOf("\"") != -1){
                        _local15 = (_local12[_local14] = _local15.replace(/"/g, ""));
                    };
                    if (_local15.indexOf(_local3) != -1){
                        _local15 = (_local12[_local14] = _local15.replace(new RegExp(_local3, "g"), "\""));
                    };
                    if (_local15.indexOf(_local4) != -1){
                        _local15 = (_local12[_local14] = _local15.replace(new RegExp(_local4, "g"), ","));
                    };
                    _local14++;
                };
                _local11++;
            };
            _local9.length--;
            if (_arg2){
                _local9 = ArrayUtil.switchDimensions(_local9);
            };
            return (_local9);
        }

    }
}//package util.csvutil 
