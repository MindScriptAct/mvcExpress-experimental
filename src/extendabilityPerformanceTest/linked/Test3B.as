/**
 * Created by Deril on 2014.05.10.
 */
package extendabilityPerformanceTest.linked {
public class Test3B implements ITest3 {

	public var _next:ITest3;

	public function Test3B() {
	}

	public function doStuff():void {
		trace("Test3B");

		if (_next != null) {
			_next.doStuff();
		}
	}

	public function set next(value:ITest3):void {
		_next = value;
	}

	public function get next():ITest3 {
		return _next;
	}
}
}
