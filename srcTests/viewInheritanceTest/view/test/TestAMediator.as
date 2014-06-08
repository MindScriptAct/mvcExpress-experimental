package viewInheritanceTest.view.test {
import mvcexpress.mvc.Mediator;

/**
 * Mediator for aplication root view object.
 */
public class TestAMediator extends Mediator {

	[Inject]
	public var view:TestA;

	override protected function onRegister():void {
		trace("TestAMediator.onRegister", "view:" + view);
	}

	override protected function onRemove():void {
	}

}
}