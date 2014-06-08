package viewInheritanceTest.view.main {
import mvcexpress.mvc.Mediator;

import viewInheritanceTest.Main;
import viewInheritanceTest.view.test.TestA;
import viewInheritanceTest.view.test.TestB1;
import viewInheritanceTest.view.test.TestB1Mediator;
import viewInheritanceTest.view.test.TestB2;
import viewInheritanceTest.view.test.TestB2Mediator;

/**
 * Mediator for aplication root view object.
 */
public class MainMediator extends Mediator {

	// view object mediator is mediator is injected by object class.
	// it can be named as you like, but "view" is commonly used.
	[Inject]
	public var view:Main;


	override protected function onRegister():void {
		trace("MainMedia tor.onRegister", "view:" + view);

		trace("..............mediating TestA.");
		var testA:TestA = new TestA();
		mediatorMap.mediate(testA);

		trace("..............mediating TestB1.");
		var testB1:TestB1 = new TestB1();
		mediatorMap.mediate(testB1);

		trace("..............mediating TestB2.");
		var testB2:TestB2 = new TestB2();
		mediatorMap.mediate(testB2);

	}


	override protected function onRemove():void {
	}

}
}