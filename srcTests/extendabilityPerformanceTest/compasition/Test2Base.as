/**
 * Created by Deril on 2014.05.10.
 */
package extendabilityPerformanceTest.compasition {
public class Test2Base {
	private var parts:Vector.<ITest2> = new <ITest2>[];

	public function Test2Base() {
	}

	public function doStuff():void {
		var partCount:int = parts.length;
		for (var i:int = 0; i < partCount; i++) {
			parts[i].doStuff();
		}
	}

	public function addPart(part:ITest2):void {
		parts.push(part);
	}
}
}
