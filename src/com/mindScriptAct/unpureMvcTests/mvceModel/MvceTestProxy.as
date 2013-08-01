package com.mindScriptAct.unpureMvcTests.mvceModel {
import com.mindScriptAct.unpureMvcTests.pmvcModel.PmvcTest2Proxy;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestConst;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestMessageTypes;

import mvcexpress.mvc.Proxy;
import mvcexpress.utils.AssertExpress;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class MvceTestProxy extends Proxy {

	[Inject]
	public var mvceProxy2:MvceTest2Proxy;

	[Inject(name="PmvcTest2Proxy")]
	public var pmvcProxy2:PmvcTest2Proxy;

	public function MvceTestProxy() {
	}

	override protected function onRegister():void {
		trace("MvceTestProxy registered.");

		AssertExpress.isNotNull(mvceProxy2, "Mvce proxy failed to get mvce proxy.");

		AssertExpress.isNotNull(pmvcProxy2, "Mvce proxy failed to get pmvc proxy.");
	}

	override protected function onRemove():void {
	}

	public function doTest():void {
		sendMessage(UnpureTestMessageTypes.EP_EC_TEST, UnpureTestConst.EP_EC);
		AssertExpress.isTrue(UnpureTestConst.EP_EC.isDone, "EC_EC_TEST fail.");

		sendMessage(UnpureTestMessageTypes.EP_EM_TEST, UnpureTestConst.EP_EM);
		AssertExpress.isTrue(UnpureTestConst.EP_EM.isDone, "EC_EM_TEST fail.");

		sendMessage(UnpureTestMessageTypes.EP_PC_TEST, UnpureTestConst.EP_PC);
		AssertExpress.isTrue(UnpureTestConst.EP_PC.isDone, "EC_PC_TEST fail.");

		sendMessage(UnpureTestMessageTypes.EP_PM_TEST, UnpureTestConst.EP_PM);
		AssertExpress.isTrue(UnpureTestConst.EP_PM.isDone, "EC_EM_TEST fail.");
	}
}
}