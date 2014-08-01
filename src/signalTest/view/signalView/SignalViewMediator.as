package signalTest.view.signalView {
import mvcexpress.extensions.signalsExpress.mvc.MediatorSignals;

import signalTest.mesages.SignalMessages;

/**
 * TODO:CLASS COMMENT
 * @author Deril
 */
public class SignalViewMediator extends MediatorSignals {

	[Inject]
	public var view:SignalView;

	override protected function onRegister():void {
		trace("SignalViewMediator.onRegister", view);

		view.clickSignal1.add(handleClick1);

		addSignalHandler(view.clickSignal2, handleClick2);
		//removeSignalHandler(view.clickSignal2, handleClick2);

		bridgeSignalToMessage(view.clickSignal3, SignalMessages.BRIDGE_TEST);
		//unbridgeSignalToMessage(view.clickSignal3, SignalMessages.BRIDGE_TEST);

		//removeAllSignalHandlers();

		// will throw error:
		//bridgeSignalToMessage(view.clickSignalBad, SignalMessages.BRIDGE_TEST);
	}


	private function handleClick1(param:String):void {
		trace("handleClick1!", param);
	}

	private function handleClick2(param:String):void {
		trace("handleClick2!", param);
	}

	override protected function onRemove():void {

	}
}
}