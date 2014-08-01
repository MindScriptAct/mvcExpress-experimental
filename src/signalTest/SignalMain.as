package signalTest {
import mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;
import flash.events.Event;

/**
 * Main application class.
 */

[Frame(factoryClass="helloWorld.Preloader")]

public class SignalMain extends Sprite {

	private var module:MainModule;

	public function SignalMain():void {
		if (stage) {
			init();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(event:Event = null):void {
		trace("Main.init > event : " + event);
		removeEventListener(Event.ADDED_TO_STAGE, init);

		// add mvcExpress logger for debugging. (press CTRL + ` to open it.)
		CONFIG::debug {
			MvcExpressLogger.init(this.stage, 0, 0, 900, 400, 1, true);
		}

		// entry point
		module = new MainModule();
		module.start(this);
	}
}
}