/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package com.mindScriptAct.pureMvcTests_singlecore.core {
import mvcexpress.dlc.unpuremvc.patterns.mediator.UnpureMediator;
import mvcexpress.dlc.unpuremvc.patterns.observer.UnpureNotification;

/**
 * A Mediator class used by ViewTest.
 *
 * @see com.mindScriptAct.pureMvcTests_singlecore.core.view.ViewTest ViewTest
 */
public class ViewTestMediator6 extends UnpureMediator {
	/**
	 * The Mediator base name
	 */
	public static const NAME:String = 'ViewTestMediator6';

	/**
	 * Constructor
	 */
	public function ViewTestMediator6(name:String, view:Object) {
		super(name, view);
	}

	override public function listNotificationInterests():Array {
		return [ ViewTest.NOTE6 ];
	}

	override public function handleNotification(note:UnpureNotification):void {
		facade.removeMediator(getMediatorName());
	}

	override protected function onRemove():void {
		viewTest.counter++;
	}

	public function get viewTest():ViewTest {
		return viewComponent as ViewTest;
	}
}
}