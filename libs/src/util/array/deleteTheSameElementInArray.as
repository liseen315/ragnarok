//Created by Action Script Viewer - http://www.buraks.com/asv
package util.array {

    public function deleteTheSameElementInArray(_arg1:Array):Array{
        var filterFun:* = null;
        var arr:* = _arg1;
        filterFun = function (_arg1:*, _arg2:int, _arg3:Array):Boolean{
            return ((_arg2 == _arg3.indexOf(_arg1)));
        }
        return (arr.filter(filterFun, null));
    }
}//package util.array 
