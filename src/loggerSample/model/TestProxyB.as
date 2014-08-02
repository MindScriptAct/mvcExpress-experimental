package loggerSample.model {
import loggerSample.messages.Message;

import mvcexpress.mvc.Proxy;

/**
 * CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class TestProxyB extends Proxy implements ITestProxyB {

	[Inject]
	public var testProxyA:TestProxyA;

	public function TestProxyB() {

	}

	override protected function onRegister():void {

	}

	override protected function onRemove():void {

	}

	/* INTERFACE mvcExpressVisualizer.model.ITestProxyB */

	public function testFunction():void {
		sendMessage(Message.TEST_PROXY_TO_COMMAND);
	}
}
}