package com.mindScriptAct.unpureMvcTests.mvceModel {
import mvcexpress.mvc.Proxy;

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