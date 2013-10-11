/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package pureMvcTests_singlecore.patterns.facade {
/**
 * A utility class used by FacadeTest.
 *
 * @see pureMvcTests_singlecore.patterns.facade.FacadeTest FacadeTest
 * @see pureMvcTests_singlecore.patterns.facade.FacadeTestCommand FacadeTestCommand
 */
public class FacadeTestVO {
	/**
	 * Constructor.
	 *
	 * @param input the number to be fed to the FacadeTestCommand
	 */
	public function FacadeTestVO(input:Number) {
		this.input = input;
	}

	public var input:Number;
	public var result:Number;
}
}