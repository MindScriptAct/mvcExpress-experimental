package loggerSample.controller {
import loggerSample.messages.Message;
import loggerSample.model.ITestProxyB;
import loggerSample.model.TestProxyA;

import flash.geom.Point;

import mvcexpress.mvc.Command;

/**
 * CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class TestCommandB extends Command {

	[Inject]
	public var testProxyA:TestProxyA;

	[Inject(name="BProxyName")]
	public var testProxyB:ITestProxyB;

	public function execute(testPoint:Point):void {
		sendMessage(Message.TEST_COMMAND_TO_COMMAND);
	}

}
}