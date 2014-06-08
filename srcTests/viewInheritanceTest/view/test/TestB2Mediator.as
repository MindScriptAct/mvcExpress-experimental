package viewInheritanceTest.view.test {
/**
 * Mediator for aplication root view object.
 */
public class TestB2Mediator extends TestAMediator {

	[Inject]
	public var viewB:TestB2;

	override protected function onRegister():void {
		trace("TestB2Mediator.onRegister", "viewB:" + viewB);
		super.onRegister();
	}

	override protected function onRemove():void {
	}

}
}