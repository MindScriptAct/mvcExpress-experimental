/*
 PureMVC - Copyright(c) 2006-08 Futurecale, Inc., Some rights reserved.
 Your reuse is governed by Creative Commons Attribution 2.5 License
 */
package com.mindScriptAct.unpureTests.patterns.facade {
/**
 * A utility class used by FacadeTest.
 *
 * @see com.mindScriptAct.unpureTests.patterns.facade.FacadeTest FacadeTest
 * @see com.mindScriptAct.unpureTests.patterns.facade.FacadeTestCommand FacadeTestCommand
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