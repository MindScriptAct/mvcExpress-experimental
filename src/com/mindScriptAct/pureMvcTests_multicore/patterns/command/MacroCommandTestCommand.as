/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package com.mindScriptAct.pureMvcTests_multicore.patterns.command {
import mvcexpress.dlc.unpuremvc.patterns.command.UnpureMacroCommand;

/**
 * A MacroCommand subclass used by MacroCommandTest.
 *
 * @see com.mindScriptAct.pureMvcTests_multicore.patterns.command.MacroCommandTest MacroCommandTest
 * @see com.mindScriptAct.pureMvcTests_multicore.patterns.command.MacroCommandTestSub1Command MacroCommandTestSub1Command
 * @see com.mindScriptAct.pureMvcTests_multicore.patterns.command.MacroCommandTestSub2Command MacroCommandTestSub2Command
 * @see com.mindScriptAct.pureMvcTests_multicore.patterns.command.MacroCommandTestVO MacroCommandTestVO
 */
public class MacroCommandTestCommand extends UnpureMacroCommand {
	/**
	 * Constructor.
	 */
	public function MacroCommandTestCommand() {
		super();
	}

	/**
	 * Initialize the MacroCommandTestCommand by adding
	 * its 2 SubCommands.
	 */
	override protected function initializeMacroCommand():void {
		addSubCommand(MacroCommandTestSub1Command);
		addSubCommand(MacroCommandTestSub2Command);
	}

}
}