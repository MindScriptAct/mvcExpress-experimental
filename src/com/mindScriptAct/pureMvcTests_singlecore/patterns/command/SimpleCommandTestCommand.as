/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package com.mindScriptAct.pureMvcTests_singlecore.patterns.command {
import mvcexpress.dlc.unpuremvc.patterns.command.UnpureSimpleCommand;
import mvcexpress.dlc.unpuremvc.patterns.observer.UnpureNotification;

/**
 * A SimpleCommand subclass used by SimpleCommandTest.
 *
 * @see com.mindScriptAct.pureMvcTests_singlecore.patterns.command.SimpleCommandTest SimpleCommandTest
 * @see com.mindScriptAct.pureMvcTests_singlecore.patterns.command.SimpleCommandTestVO SimpleCommandTestVO
 */
public class SimpleCommandTestCommand extends UnpureSimpleCommand {

	/**
	 * Constructor.
	 */
	public function SimpleCommandTestCommand() {
		super();
	}

	/**
	 * Fabricate a result by multiplying the input by 2
	 *
	 * @param event the <code>INotification</code> carrying the <code>SimpleCommandTestVO</code>
	 */
	override public function execute(note:UnpureNotification):void {

		var vo:SimpleCommandTestVO = note.getBody() as SimpleCommandTestVO;

		// Fabricate a result
		vo.result = 2 * vo.input;

	}

}
}