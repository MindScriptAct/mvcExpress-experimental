package loggerSample.controller {
import loggerSample.messages.Message;
import loggerSample.model.TestProxyA;

import mvcexpress.mvc.Command;

/**
 * CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class TestCommandA extends Command {

	[Inject]
	public var testProxyA:TestProxyA;

	public function execute(testText:String):void {
		sendMessage(Message.TEST_COMMAND_TO_MEDIATOR);
	}

}
}