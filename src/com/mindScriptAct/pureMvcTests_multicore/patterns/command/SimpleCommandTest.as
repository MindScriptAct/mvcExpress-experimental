/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package com.mindScriptAct.pureMvcTests_multicore.patterns.command {
import flexunit.framework.TestCase;
import flexunit.framework.TestSuite;

import mvcexpress.core.namespace.pureLegsCore;
import mvcexpress.dlc.unpuremvc.patterns.observer.UnpureNotification;
import mvcexpress.mvc.Command;

/**
 * Test the PureMVC SimpleCommand class.
 *
 * @see com.mindScriptAct.pureMvcTests_multicore.patterns.command.SimpleCommandTestVO SimpleCommandTestVO
 * @see com.mindScriptAct.pureMvcTests_multicore.patterns.command.SimpleCommandTestCommand SimpleCommandTestCommand
 */
public class SimpleCommandTest extends TestCase {

	/**
	 * Constructor.
	 *
	 * @param methodName the name of the test method an instance to run
	 */
	public function SimpleCommandTest(methodName:String) {
		super(methodName);
	}

	/**
	 * Create the TestSuite.
	 */
	public static function suite():TestSuite {

		var ts:TestSuite = new TestSuite();

		ts.addTest(new SimpleCommandTest("testSimpleCommandExecute"));

		return ts;
	}

	/**
	 * Tests the <code>execute</code> method of a <code>SimpleCommand</code>.
	 *
	 * <P>
	 * This test creates a new <code>Notification</code>, adding a
	 * <code>SimpleCommandTestVO</code> as the body.
	 * It then creates a <code>SimpleCommandTestCommand</code> and invokes
	 * its <code>execute</code> method, passing in the note.</P>
	 *
	 * <P>
	 * Success is determined by evaluating a property on the
	 * object that was passed on the Notification body, which will
	 * be modified by the SimpleCommand</P>.
	 *
	 */
	public function testSimpleCommandExecute():void {

		// Create the VO
		var vo:SimpleCommandTestVO = new SimpleCommandTestVO(5);

		// Create the Notification (note)
		var note:UnpureNotification = new UnpureNotification('SimpleCommandTestNote', vo);

		// Create the SimpleCommand
		// Create the SimpleCommand
		use namespace pureLegsCore;

		Command.canConstruct = true;
		var command:SimpleCommandTestCommand = new SimpleCommandTestCommand();
		Command.canConstruct = false;

		// Execute the SimpleCommand
		command.execute(note);

		// test assertions
		assertTrue("Expecting vo.result == 10", vo.result == 10);

	}

}
}