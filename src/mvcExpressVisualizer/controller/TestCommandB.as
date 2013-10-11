package mvcExpressVisualizer.controller {
import mvcExpressVisualizer.messages.Message;
import mvcExpressVisualizer.model.ITestProxyB;
import mvcExpressVisualizer.model.TestProxyA;

import flash.geom.Point;

import mvcexpress.mvc.Command;

/**
 * CLASS COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
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