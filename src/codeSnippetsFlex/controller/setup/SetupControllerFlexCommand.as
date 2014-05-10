package codeSnippetsFlex.controller.setup {
import codeSnippets.controller.SampleCommand;
import codeSnippets.messages.Msg;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Deril
 */
public class SetupControllerFlexCommand extends Command {

	public function execute(blank:Object):void {
		////////////////////////////
		// mediatorInjectTest.controller
		////////////////////////////
		commandMap.map(Msg.TEST, SampleCommand);
		//commandMap.unmap(Msg.TEST, SampleCommand);
	}

}
}
