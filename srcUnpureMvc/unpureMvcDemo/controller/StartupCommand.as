/*
 PureMVC AS3 Demo - Flex Employee Admin
 Copyright (c) 2007-10 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package unpureMvcDemo.controller {
import mvcexpress.extensions.unpuremvc.patterns.command.UnpureMacroCommand;

public class StartupCommand extends UnpureMacroCommand {
	/**
	 * Add the Subcommands to startup the PureMVC apparatus.
	 *
	 * Generally, it is best to prep the Model (mostly registering
	 * proxies)followed by preparation of the View (mostly registering
	 * Mediators).
	 */
	override protected function initializeMacroCommand():void {
		this.addSubCommand(PrepModelCommand);
		this.addSubCommand(PrepViewCommand);
	}
}
}