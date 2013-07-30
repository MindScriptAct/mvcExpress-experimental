package com.mindScriptAct.unpureMvcTests.mvceModel {
import mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class MvceTestProxy extends Proxy {

	public function MvceTestProxy() {
	}

	override protected function onRegister():void {
		trace("MvceTestProxy registered.");
	}

	override protected function onRemove():void {
	}

}
}