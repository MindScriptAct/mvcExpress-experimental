/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package pureMvcTests_singlecore.core {
import mvcexpress.extensions.unpuremvc.patterns.observer.UnpureNotification;

/**
 * A Notification class used by ViewTest.
 *
 * @see pureMvcTests_singlecore.core.view.ViewTest ViewTest
 */
public class ViewTestNote extends UnpureNotification {
	/**
	 * The name of this Notification.
	 */
	public static const NAME:String = "ViewTestNote";

	/**
	 * Constructor.
	 *
	 * @param name Ignored and forced to NAME.
	 * @param body the body of the Notification to be constructed.
	 */
	public function ViewTestNote(name:String, body:Object) {
		super(NAME, body);
	}

	/**
	 * Factory method.
	 *
	 * <P>
	 * This method creates new instances of the ViewTestNote class,
	 * automatically setting the note name so you don't have to. Use
	 * this as an alternative to the constructor.</P>
	 *
	 * @param name the name of the Notification to be constructed.
	 * @param body the body of the Notification to be constructed.
	 */
	public static function create(body:Object):UnpureNotification {
		return new ViewTestNote(NAME, body);
	}
}
}