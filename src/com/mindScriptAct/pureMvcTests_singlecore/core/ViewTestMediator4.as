/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package com.mindScriptAct.pureMvcTests_singlecore.core {
import mvcexpress.extensions.unpuremvc.patterns.mediator.UnpureMediator;

/**
 * A Mediator class used by ViewTest.
 *
 * @see com.mindScriptAct.pureMvcTests_singlecore.core.view.ViewTest ViewTest
 */
public class ViewTestMediator4 extends UnpureMediator {
	/**
	 * The Mediator name
	 */
	public static const NAME:String = 'ViewTestMediator4';

	/**
	 * Constructor
	 */
	public function ViewTestMediator4(view:Object) {
		super(NAME, view);
	}

	public function get viewTest():ViewTest {
		return viewComponent as ViewTest;
	}

	override protected function onRegister():void {
		viewTest.onRegisterCalled = true;
	}

	override protected function onRemove():void {
		viewTest.onRemoveCalled = true;
	}


}
}