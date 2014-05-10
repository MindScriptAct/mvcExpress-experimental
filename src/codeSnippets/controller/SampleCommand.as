package codeSnippets.controller {
import codeSnippets.messages.Msg;
import codeSnippets.model.SampleProxy;

import mvcexpress.mvc.Command;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class SampleCommand extends Command {

	////////////////////////////
	// geting proxies...
	////////////////////////////
	[Inject]
	public var sampleProxy:SampleProxy;

	// execute MUST have 1 and only one parameter. This parameter can be typed(or be Object type)

	public function execute(params:Object):void {
		trace("SampleCommand.execute > params : " + params);

		sampleProxy.sendTestMessage();

		////////////////////////////
		// Proxy
		////////////////////////////

		proxyMap

		////////////////////////////
		// view
		////////////////////////////

		mediatorMap

		////////////////////////////
		// view
		////////////////////////////

		commandMap

		////////////////////////////
		// comunication
		////////////////////////////

		sendMessage(Msg.TEST_DATA_MESSAGE, "send some data to listeners......");

	}

}
}