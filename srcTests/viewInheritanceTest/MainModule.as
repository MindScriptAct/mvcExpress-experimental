package viewInheritanceTest {
import mvcexpress.modules.ModuleCore;

import viewInheritanceTest.view.main.MainMediator;
import viewInheritanceTest.view.test.TestA;
import viewInheritanceTest.view.test.TestAMediator;
import viewInheritanceTest.view.test.TestB1;
import viewInheritanceTest.view.test.TestB1Mediator;
import viewInheritanceTest.view.test.TestB2;
import viewInheritanceTest.view.test.TestB2Mediator;

/**
 * Main application module.
 * Sets up application and starts it.
 */
public class MainModule extends ModuleCore {

	override protected function onInit():void {
		trace("MainModule.onInit");

		// map mediators(you can map them here.. or move it to command.)
		mediatorMap.map(Main, MainMediator);

		mediatorMap.map(TestA, TestAMediator);

		mediatorMap.map(TestB1, TestB1Mediator/*, TestB1, TestAMediator, TestA*/);
		mediatorMap.map(TestB2, TestB2Mediator/*, TestB2, TestAMediator, TestA*/);
	}

	public function start(main:Main):void {
		trace("MainModule.start > main : " + main);

		// mediate main view.
		mediatorMap.mediate(main);
	}

}
}