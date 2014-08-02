package runTestModularSampleModules.console.controller {
import runTestModularSample.constants.ScopeNames;
import runTestModularSampleModules.console.Console;
import runTestModularSampleModules.console.model.ConsoleLogProxy;
import runTestModularSampleModules.console.msg.ConsoleDataMsg;
import runTestModularSampleModules.console.msg.ConsoleMsg;
import runTestModularSampleModules.console.msg.ConsoleViewMsg;
import runTestModularSampleModules.console.view.ConsoleMediator;
import runTestModularSampleModules.globalMessages.GlobalMessage;

import mvcexpress.extensions.scoped.mvc.CommandScoped;
import mvcexpress.utils.checkClassStringConstants;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class InitConsoleModuleCommand extends CommandScoped {

	public function execute(main:Console):void {
		trace("Console.onInit");

		registerScope(ScopeNames.FIRST_SCOPE);
		registerScope(ScopeNames.EVEN_SCOPE);
		registerScope(ScopeNames.ALL_SCORE);

		// for debugging
		CONFIG::debug {
			checkClassStringConstants(ConsoleMsg, ConsoleDataMsg, ConsoleViewMsg);
			//MvcExpressLogger.init(main.stage, 700, 0, 800, 400, 1, true);
		}

		// set up commands
		commandMap.map(ConsoleViewMsg.INPUT_MESSAGE, HandleInputCommand);

		commandMap.map(GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL, HandleInputCommand);

		if (main.consoleId == 1) {
			commandMapScoped.scopeMap(ScopeNames.FIRST_SCOPE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, HandleInputCommand);
		}
		if (main.consoleId == 2 || main.consoleId == 4) {
			commandMapScoped.scopeMap(ScopeNames.EVEN_SCOPE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, HandleInputCommand);
		}
		commandMapScoped.scopeMap(ScopeNames.ALL_SCORE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, HandleInputCommand);


		// set up view
		proxyMap.map(new ConsoleLogProxy(main.consoleId));

		mediatorMap.map(Console, ConsoleMediator);

		// start main view.

		mediatorMap.mediate(main);
	}

}
}
