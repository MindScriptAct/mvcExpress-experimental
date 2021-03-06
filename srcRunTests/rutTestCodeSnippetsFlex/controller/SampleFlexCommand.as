package rutTestCodeSnippetsFlex.controller {
import rutTestCodeSnippetsFlex.messages.MsgFlex;
import rutTestCodeSnippetsFlex.model.SampleFlexProxy;

import mvcexpress.mvc.Command;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class SampleFlexCommand extends Command {

	////////////////////////////
	// geting proxies...
	////////////////////////////
	[Inject]
	public var sampleProxy:SampleFlexProxy;

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

		sendMessage(MsgFlex.TEST_DATA_MESSAGE, "send some data to listeners......");

	}

}
}