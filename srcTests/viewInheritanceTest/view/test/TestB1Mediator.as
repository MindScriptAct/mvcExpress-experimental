package viewInheritanceTest.view.test {
import mvcexpress.mvc.Mediator;

/**
 * Mediator for aplication root view object.
 */
public class TestB1Mediator extends TestAMediator {

	[Inject]
	public var viewB:TestB1;

	override protected function onRegister():void {
		trace("TestB1Mediator.onRegister", "viewB:" + viewB);
		super.onRegister();
	}

	override protected function onRemove():void {
	}

}
}