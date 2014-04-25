//Created by Action Script Viewer - http://www.buraks.com/asv
package util.array {
    import __AS3__.vec.*;

    public class ArrayUtil {

        public static function arrayContainsArray(_arg1:*, _arg2:*, _arg3:Boolean=false):Boolean{
            /*var _local5:*;
            var _local6:*;
            var _local7:*;
            var _local8:int;
            if (((((((((!((_arg1 is Array))) && (!((_arg1 is Vector.<null>))))) && (!((_arg1 is Vector.<int>))))) && (!((_arg1 is Vector.<uint>))))) && (!((_arg1 is Vector.<Number>))))){
                throw (new Error((("[arr1:" + _arg1) + "]参数必须只能是Array或者Vector类型")));
            };
            if (((((((((!((_arg2 is Array))) && (!((_arg1 is Vector.<null>))))) && (!((_arg2 is Vector.<int>))))) && (!((_arg2 is Vector.<uint>))))) && (!((_arg2 is Vector.<Number>))))){
                throw (new Error((("[arr2:" + _arg2) + "]参数必须只能是Array或者Vector类型")));
            };
            if (_arg2.length > _arg1.length){
                return (false);
            };
            var _local4:int = _arg2.length;
            if (_arg3){
                _local5 = _arg1.slice();
                _local6 = _arg2.slice();
                while (_local6.length) {
                    _local7 = _local6.shift();
                    if (_local5.indexOf(_local7) == -1){
                        return (false);
                    };
                    _local5 = _local5.slice((_local5.indexOf(_local7) + 1));
                    if (_local6.length > _local5.length){
                        return (false);
                    };
                };
            } else {
                _local8 = 0;
                while (_local8 < _local4) {
                    if (_arg1.indexOf(_arg2[_local8]) == -1){
                        return (false);
                    };
                    _local8++;
                };
            };*/
            return (true);
        }
        public static function switchDimensions(_arg1:Array):Array{
            var colMax:* = 0;
            var tmpArr:* = null;
            var row:* = 0;
            var arr:* = _arg1;
            var newArr:* = new Array();
            var rowMax:* = arr.length;
            try {
                if ((arr[0] is Array)){
                    colMax = arr[0].length;
                } else {
                    throw (new TypeError("muse be a 2d array"));
                };
            } catch(error:TypeError) {
            };
            var col:* = 0;
            while (col < colMax) {
                tmpArr = new Array();
                row = 0;
                while (row < rowMax) {
                    tmpArr[row] = arr[row][col];
                    row = (row + 1);
                };
                newArr[col] = tmpArr;
                col = (col + 1);
            };
            return (newArr);
        }

    }
}//package util.array 
