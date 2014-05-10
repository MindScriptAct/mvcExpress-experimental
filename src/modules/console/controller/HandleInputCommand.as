package modules.console.controller {
import modules.console.model.ConsoleLogProxy;

import mvcexpress.mvc.Command;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class HandleInputCommand extends Command {

	[Inject]
	public var consoleLogProxy:ConsoleLogProxy;

	public function execute(messageText:String):void {
		//trace("HandleInputCommand.execute > messageText : " + messageText);
		consoleLogProxy.pushMessage(messageText);
	}

}
}