package loggerSample.model {
import loggerSample.messages.Message;

import mvcexpress.mvc.Proxy;

/**
 * CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class TestProxyA extends Proxy {

	public function TestProxyA() {

	}

	public function changeSomething():void {
		sendMessage(Message.TEST_PROXY_TO_MEDIATOR);
	}

	override protected function onRegister():void {

	}

	override protected function onRemove():void {

	}

}
}