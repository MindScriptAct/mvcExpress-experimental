package signalTest {
import mvcexpress.modules.ModuleCore;

import signalTest.controller.SignalTriggeredCommand;
import signalTest.mesages.SignalMessages;
import signalTest.view.signalView.SignalView;
import signalTest.view.signalView.SignalViewMediator;

/**
 * Main application module.
 * Sets up application and starts it.
 */
public class SignalMainModule extends ModuleCore {

	override protected function onInit():void {
		trace("SignalMainModule.onInit");

		commandMap.map(SignalMessages.BRIDGE_TEST, SignalTriggeredCommand);

		mediatorMap.map(SignalView, SignalViewMediator);
	}

	public function start(main:SignalMain):void {
		trace("SignalMainModule.start > main : " + main);

		var test:SignalView = new SignalView();
		main.addChild(test);
		mediatorMap.mediate(test);

	}

}
}