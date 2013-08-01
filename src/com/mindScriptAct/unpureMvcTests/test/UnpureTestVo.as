package com.mindScriptAct.unpureMvcTests.test {
public class UnpureTestVo {

	private static var _compleateCount:int = 0;

	private var id:int;

	private var _isDone:Boolean = false;


	public function UnpureTestVo(id:int) {
		this.id = id;
	}

	public function compleate():void {
		if (_isDone) {
			throw Error("Should be tested just once.");
		}
		_isDone = true;
		_compleateCount++;
	}

	public function get isDone():Boolean {
		return _isDone;
	}

	public static function get compleateCount():int {
		return _compleateCount;
	}
}
}
