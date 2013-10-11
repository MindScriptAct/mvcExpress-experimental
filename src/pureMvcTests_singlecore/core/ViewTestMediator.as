/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package pureMvcTests_singlecore.core {
import mvcexpress.extensions.unpuremvc.patterns.mediator.UnpureMediator;

/**
 * A Mediator class used by ViewTest.
 *
 * @see pureMvcTests_singlecore.core.view.ViewTest ViewTest
 */
public class ViewTestMediator extends UnpureMediator {
	/**
	 * The Mediator name
	 */
	public static const NAME:String = 'ViewTestMediator';

	/**
	 * Constructor
	 */
	public function ViewTestMediator(view:Object) {
		super(NAME, view);
	}

	override public function listNotificationInterests():Array {
		// be sure that the mediator has some Observers created
		// in order to test removeMediator
		return [ 'ABC', 'DEF', 'GHI'  ];
	}

}
}