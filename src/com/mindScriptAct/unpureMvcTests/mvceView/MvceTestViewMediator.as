package com.mindScriptAct.unpureMvcTests.mvceView {
import com.mindScriptAct.unpureMvcTests.testView.UnpureTestView;

import mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class MvceTestViewMediator extends Mediator {

	[Inject]
	public var view:UnpureTestView;

	override protected function onRegister():void {
		trace("MvceTestViewMediator registered:", view);
	}

	override protected function onRemove():void {

	}
}
}