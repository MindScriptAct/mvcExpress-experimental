/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package com.mindScriptAct.pureMvcTests_singlecore.patterns.mediator {
import flexunit.framework.TestCase;
import flexunit.framework.TestSuite;

import mvcexpress.dlc.unpuremvc.patterns.mediator.UnpureMediator;

/**
 * Test the PureMVC Mediator class.
 *
 * @see com.mindScriptAct.pureMvcTests_singlecore.interfaces.IMediator IMediator
 * @see com.mindScriptAct.pureMvcTests_singlecore.patterns.mediator.UnpureMediator Mediator
 */
public class MediatorTest extends TestCase {

	/**
	 * Constructor.
	 *
	 * @param methodName the name of the test method an instance to run
	 */
	public function MediatorTest(methodName:String) {
		super(methodName);
	}

	/**
	 * Create the TestSuite.
	 */
	public static function suite():TestSuite {
		var ts:TestSuite = new TestSuite();

		ts.addTest(new MediatorTest("testNameAccessor"));
		ts.addTest(new MediatorTest("testViewAccessor"));

		return ts;
	}


	/**
	 * Tests getting the name using Mediator class accessor method.
	 */
	public function testNameAccessor():void {

		// Create a new Mediator and use accessors to set the mediator name
		var mediator:UnpureMediator = new UnpureMediator();

		// test assertions
		assertTrue("Expecting mediator.getMediatorName() == Mediator.NAME", mediator.getMediatorName() == UnpureMediator.NAME);
	}

	/**
	 * Tests getting the name using Mediator class accessor method.
	 */
	public function testViewAccessor():void {

		// Create a view object
		var view:Object = new Object();

		// Create a new Proxy and use accessors to set the proxy name
		var mediator:UnpureMediator = new UnpureMediator(UnpureMediator.NAME, view);

		// test assertions
		assertNotNull("Expecting mediator.getViewComponent() not null", mediator.getViewComponent());
	}

}
}