package signalTest {
import mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;
import flash.events.Event;

/**
 * Main application class.
 */
[SWF(width="1200", height="786", frameRate="60")]
public class SignalMain extends Sprite {

	private var module:SignalMainModule;

	public function SignalMain():void {
		if (stage) {
			init();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(event:Event = null):void {
		trace("SignalMain.init > event : " + event);
		removeEventListener(Event.ADDED_TO_STAGE, init);

		// add mvcExpress logger for debugging. (press CTRL + ` to open it.)
		CONFIG::debug {
			MvcExpressLogger.init(this.stage, 10, 100, 900, 400, 1, true);
		}

		// entry point
		module = new SignalMainModule();
		module.start(this);
	}
}
}