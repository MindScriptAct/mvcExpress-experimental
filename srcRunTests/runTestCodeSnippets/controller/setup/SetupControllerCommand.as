package runTestCodeSnippets.controller.setup {
import runTestCodeSnippets.controller.SampleCommand;
import runTestCodeSnippets.messages.Msg;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Deril
 */
public class SetupControllerCommand extends Command {

	public function execute(blank:Object):void {
		////////////////////////////
		// mediatorInjectTest.controller
		////////////////////////////
		commandMap.map(Msg.TEST, SampleCommand);
		//commandMap.unmap(Msg.TEST, SampleCommand);
	}

}
}
