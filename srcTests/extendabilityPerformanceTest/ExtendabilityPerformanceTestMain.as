package extendabilityPerformanceTest {
import com.gskinner.performance.PerformanceTest;

import extendabilityPerformanceTest.compasition.Test2A;
import extendabilityPerformanceTest.compasition.Test2B;
import extendabilityPerformanceTest.compasition.Test2Base;
import extendabilityPerformanceTest.compasition.Test2C;
import extendabilityPerformanceTest.inheritance.Test1C;
import extendabilityPerformanceTest.linked.Test3A;
import extendabilityPerformanceTest.linked.Test3B;
import extendabilityPerformanceTest.linked.Test3C;

import flash.display.Sprite;
import flash.text.TextField;
import flash.utils.setTimeout;

[SWF(width="1024", height="600", frameRate="60")]
public class ExtendabilityPerformanceTestMain extends Sprite {

	/** Dictionary with constonts of inject names, used with constName, and constScope. */

	private static const TEST_ITERATIONS:int = 10;
	private static const TEST_COUNT:int = 100000;

	private var output:TextField;

	public function ExtendabilityPerformanceTestMain() {

		output = new TextField();
		output.width = 1000;
		output.height = 900;
		output.text = "Starting test...\n";

		this.addChild(output);
		setTimeout(doTest1a, 2000);
	}


	private function doTest1a():void {
		output.appendText("\n" + PerformanceTest.run(createTest1, "Create inheritance test:", TEST_ITERATIONS, TEST_COUNT));
		setTimeout(doTest2a, 1000);
	}

	private function doTest2a():void {
		output.appendText("\n" + PerformanceTest.run(createTest2, "Create composition test:", TEST_ITERATIONS, TEST_COUNT));
		setTimeout(doTest3a, 1000);
	}

	private function doTest3a():void {
		output.appendText("\n" + PerformanceTest.run(createTest3, "Create linkedList test:", TEST_ITERATIONS, TEST_COUNT));
		output.appendText("\n");
		setTimeout(doTest1b, 1000);
	}

	private function doTest1b():void {
		output.appendText("\n" + PerformanceTest.run(runTest1, "Run inheritance test:", TEST_ITERATIONS, TEST_COUNT));
		setTimeout(doTest2b, 1000);
	}

	private function doTest2b():void {
		output.appendText("\n" + PerformanceTest.run(runTest2, "Run composition test:", TEST_ITERATIONS, TEST_COUNT));
		setTimeout(doTest3b, 1000);
	}

	private function doTest3b():void {
		output.appendText("\n" + PerformanceTest.run(runTest3, "Run linkedList test:", TEST_ITERATIONS, TEST_COUNT));
		output.appendText("\nDONE.");
		//setTimeout(doTest3a, 1000);
	}


	//////

	private var test1:Test1C;

	public function createTest1():void {
		test1 = new Test1C();
	}

	public function runTest1():void {
		test1.doStuff();
	}

	/////////

	private var test2:Test2Base;

	public function createTest2():void {
		test2 = new Test2Base();
		test2.addPart(new Test2A());
		test2.addPart(new Test2B());
		test2.addPart(new Test2C());
	}

	public function runTest2():void {
		test2.doStuff();
	}

	/////////

	private var test3:Test3A;

	public function createTest3():void {
		test3 = new Test3A();
		test3.next = new Test3B();
		test3.next.next = new Test3C();
	}

	public function runTest3():void {
		test3.doStuff();
	}


}
}
