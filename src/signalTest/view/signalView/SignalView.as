/**
 * Created by Deril on 2014.06.19.
 */
package signalTest.view.signalView {
import com.bit101.components.PushButton;

import flash.display.Sprite;
import flash.events.MouseEvent;

import mindscriptact.signalsExpress.SignalExpress;

public class SignalView extends Sprite {

	public var clickSignal1:SignalExpress = new SignalExpress();
	public var clickSignal2:SignalExpress = new SignalExpress();
	public var clickSignal3:SignalExpress = new SignalExpress();

	public var clickSignalBad:SignalExpress = new SignalExpress(int, int);

	public function SignalView() {
		new PushButton(this, 10, 10, "test1", handleClick1)
		new PushButton(this, 150, 10, "test2", handleClick2)
		new PushButton(this, 300, 10, "test3", handleClick3)
	}

	private function handleClick1(event:MouseEvent):void {
		trace("click1!");
		clickSignal1.dispatch("111");
	}

	private function handleClick2(event:MouseEvent):void {
		trace("click2!");
		clickSignal2.dispatch("222");
	}

	private function handleClick3(event:MouseEvent):void {
		trace("click3!");
		clickSignal3.dispatch("333");
	}
}
}
2