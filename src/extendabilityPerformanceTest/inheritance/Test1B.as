/**
 * Created by Deril on 2014.05.10.
 */
package extendabilityPerformanceTest.inheritance {
public class Test1B extends Test1A {

	public function Test1B() {
		super();
	}

	override public function doStuff():void {
		super.doStuff();
		trace("Test1B");
	}
}
}
