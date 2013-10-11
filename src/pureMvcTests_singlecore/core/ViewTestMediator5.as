/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package pureMvcTests_singlecore.core {
import mvcexpress.extensions.unpuremvc.patterns.mediator.UnpureMediator;
import mvcexpress.extensions.unpuremvc.patterns.observer.UnpureNotification;

/**
 * A Mediator class used by ViewTest.
 *
 * @see pureMvcTests_singlecore.core.view.ViewTest ViewTest
 */
public class ViewTestMediator5 extends UnpureMediator {
	/**
	 * The Mediator name
	 */
	public static const NAME:String = 'ViewTestMediator5';

	/**
	 * Constructor
	 */
	public function ViewTestMediator5(view:Object) {
		super(NAME, view);
	}

	override public function listNotificationInterests():Array {
		return [ ViewTest.NOTE5 ];
	}

	override public function handleNotification(note:UnpureNotification):void {
		viewTest.counter++;
	}

	public function get viewTest():ViewTest {
		return viewComponent as ViewTest;
	}
}
}