package codeSnippets.controller.setup {
import codeSnippets.controller.SampleCommand;
import codeSnippets.messages.Msg;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Deril
 */
public class SetupControllerCommand extends Command {

	public function execute(blank:Object):void {
		////////////////////////////
		// controller
		////////////////////////////
		commandMap.map(Msg.TEST, SampleCommand);
		//commandMap.unmap(Msg.TEST, SampleCommand);
	}

}
}
