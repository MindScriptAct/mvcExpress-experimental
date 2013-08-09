/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package com.mindScriptAct.pureMvcTests_singlecore.core {
import mvcexpress.extensions.unpuremvc.patterns.mediator.UnpureMediator;
import mvcexpress.extensions.unpuremvc.patterns.observer.UnpureNotification;

/**
 * A Mediator class used by ViewTest.
 *
 * @see com.mindScriptAct.pureMvcTests_singlecore.core.view.ViewTest ViewTest
 */
public class ViewTestMediator2 extends UnpureMediator {
	/**
	 * The Mediator name
	 */
	public static const NAME:String = 'ViewTestMediator2';

	/**
	 * Constructor
	 */
	public function ViewTestMediator2(view:Object) {
		super(NAME, view);
	}

	override public function listNotificationInterests():Array {
		// be sure that the mediator has some Observers created
		// in order to test removeMediator
		return [ ViewTest.NOTE1, ViewTest.NOTE2 ];
	}

	override public function handleNotification(notification:UnpureNotification):void {
		viewTest.lastNotification = notification.getName();
	}

	public function get viewTest():ViewTest {
		return viewComponent as ViewTest;
	}

}
}