/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package pureMvcTests_singlecore.core {
/**
 * A utility class used by ControllerTest.
 *
 * @see pureMvcTests_singlecore.core.controller.ControllerTest ControllerTest
 * @see pureMvcTests_singlecore.core.controller.ControllerTestCommand ControllerTestCommand
 */
public class ControllerTestVO {
	/**
	 * Constructor.
	 *
	 * @param input the number to be fed to the ControllerTestCommand
	 */
	public function ControllerTestVO(input:Number) {
		this.input = input;
	}

	public var input:Number = 0;
	public var result:Number = 0;
}
}