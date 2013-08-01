package com.mindScriptAct.unpureMvcTests.mvceModel {
import com.mindScriptAct.unpureMvcTests.test.UnpureTestConst;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestMessageTypes;

import mvcexpress.mvc.Proxy;
import mvcexpress.utils.AssertExpress;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class MvceTest2Proxy extends Proxy {

	public function MvceTest2Proxy() {
	}

	override protected function onRegister():void {
		trace("MvceTest2Proxy registered.");
	}

	override protected function onRemove():void {
	}
}
}