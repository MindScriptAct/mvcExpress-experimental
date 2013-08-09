/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package com.mindScriptAct.pureMvcTests_multicore.patterns.command {
import mvcexpress.extensions.unpuremvc.patterns.command.UnpureSimpleCommand;
import mvcexpress.extensions.unpuremvc.patterns.observer.UnpureNotification;

/**
 * A SimpleCommand subclass used by MacroCommandTestCommand.
 *
 * @see com.mindScriptAct.pureMvcTests_multicore.patterns.command.MacroCommandTest MacroCommandTest
 * @see com.mindScriptAct.pureMvcTests_multicore.patterns.command.MacroCommandTestCommand MacroCommandTestCommand
 * @see com.mindScriptAct.pureMvcTests_multicore.patterns.command.MacroCommandTestVO MacroCommandTestVO
 */
public class MacroCommandTestSub2Command extends UnpureSimpleCommand {
	public function MacroCommandTestSub2Command() {
		super();
	}

	/**
	 * Fabricate a result by multiplying the input by itself
	 *
	 * @param event the <code>IEvent</code> carrying the <code>MacroCommandTestVO</code>
	 */
	override public function execute(note:UnpureNotification):void {

		var vo:MacroCommandTestVO = note.getBody() as MacroCommandTestVO;

		// Fabricate a result
		vo.result2 = vo.input * vo.input;

	}

}
}