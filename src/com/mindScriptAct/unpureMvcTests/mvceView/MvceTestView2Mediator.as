package com.mindScriptAct.unpureMvcTests.mvceView {
import com.mindScriptAct.unpureMvcTests.testView.UnpureTestView2;

import mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class MvceTestView2Mediator extends Mediator {

	[Inject]
	public var view:UnpureTestView2;

	override protected function onRegister():void {
		trace("MvceTestViewMediator registered:", view);
	}

	override protected function onRemove():void {

	}
}
}