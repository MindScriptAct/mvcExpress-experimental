package loggerSample.view {
import com.bit101.components.PushButton;
import loggerSample.VisualLoggerTest;

import mvcexpress.mvc.Mediator;

/**
 * CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class VisualLoggerTestModuleMediator extends Mediator {
	private var testViewB1Button:PushButton;
	private var testViewB2Button:PushButton;

	[Inject]
	public var view:VisualLoggerTest;

	//[Inject]
	//public var myProxy:MyProxy;

	override protected function onRegister():void {
	}

	override protected function onRemove():void {
	}

}
}