/**
 * Created by Deril on 2014.05.10.
 */
package extendabilityPerformanceTest.inheritance {
public class Test1C extends Test1B {

	public function Test1C() {
		super();
	}

	override public function doStuff():void {
		super.doStuff();
		trace("Test1C");
	}
}
}
