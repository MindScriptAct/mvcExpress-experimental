/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package com.mindScriptAct.pureMvcTests_singlecore.patterns.facade {
import mvcexpress.dlc.unpuremvc.patterns.command.UnpureSimpleCommand;
import mvcexpress.dlc.unpuremvc.patterns.observer.UnpureNotification;

/**
 * A SimpleCommand subclass used by FacadeTest.
 *
 * @see com.mindScriptAct.pureMvcTests_singlecore.patterns.facade.FacadeTest FacadeTest
 * @see com.mindScriptAct.pureMvcTests_singlecore.patterns.facade.FacadeTestVO FacadeTestVO
 */
public class FacadeTestCommand extends UnpureSimpleCommand {

	/**
	 * Constructor.
	 */
	public function FacadeTestCommand() {
		super();
	}

	/**
	 * Fabricate a result by multiplying the input by 2
	 *
	 * @param note the Notification carrying the FacadeTestVO
	 */
	override public function execute(note:UnpureNotification):void {

		var vo:FacadeTestVO = note.getBody() as FacadeTestVO;

		// Fabricate a result
		vo.result = 2 * vo.input;

	}

}
}