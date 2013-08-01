package com.mindScriptAct.unpureMvcTests.mvceView {
import com.mindScriptAct.unpureMvcTests.mvceModel.MvceTestProxy;
import com.mindScriptAct.unpureMvcTests.pmvcModel.PmvcTestProxy;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestConst;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestMessageTypes;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestVo;
import com.mindScriptAct.unpureMvcTests.testView.UnpureTestView;

import mvcexpress.mvc.Mediator;
import mvcexpress.utils.AssertExpress;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class MvceTestViewMediator extends Mediator {

	[Inject]
	public var view:UnpureTestView;

	[Inject]
	public var mvceProxy:MvceTestProxy;

	[Inject(name="PmvcTestProxy")]
	public var pmvcProxy:PmvcTestProxy;

	override protected function onRegister():void {
		trace("MvceTestViewMediator registered:", view);

		AssertExpress.isNotNull(mvceProxy, "Mvce mediator failed to get mvce proxy.");

		AssertExpress.isNotNull(pmvcProxy, "Mvce mediator failed to get pmvc proxy.");

		addHandler(UnpureTestMessageTypes.F_EM_TEST, handle_F_EM_Test);
		addHandler(UnpureTestMessageTypes.EC_EM_TEST, handle_EC_EM_Test);
		addHandler(UnpureTestMessageTypes.EP_EM_TEST, handle_EP_EM_Test);
		addHandler(UnpureTestMessageTypes.EM_EM_TEST, handle_EM_EM_Test);
		addHandler(UnpureTestMessageTypes.PC_EM_TEST, handle_PC_EM_Test);
		addHandler(UnpureTestMessageTypes.PP_EM_TEST, handle_PP_EM_Test);
		addHandler(UnpureTestMessageTypes.PM_EM_TEST, handle_PM_EM_Test);
		addHandler(UnpureTestMessageTypes.PCe_EM_TEST, handle_PCe_EM_Test);
		addHandler(UnpureTestMessageTypes.PPe_EM_TEST, handle_PPe_EM_Test);
		addHandler(UnpureTestMessageTypes.PMe_EM_TEST, handle_PMe_EM_Test);
	}


	public function handle_F_EM_Test(testParam:UnpureTestVo):void {
		testParam.compleate();


		//////////////////////////////

		sendMessage(UnpureTestMessageTypes.EM_EC_TEST, UnpureTestConst.EM_EC);
		AssertExpress.isTrue(UnpureTestConst.EM_EC.isDone, "EC_EC_TEST fail.");

		sendMessage(UnpureTestMessageTypes.EM_EM_TEST, UnpureTestConst.EM_EM);
		AssertExpress.isTrue(UnpureTestConst.EM_EM.isDone, "EC_EM_TEST fail.");

		sendMessage(UnpureTestMessageTypes.EM_PC_TEST, UnpureTestConst.EM_PC);
		AssertExpress.isTrue(UnpureTestConst.EM_PC.isDone, "EC_PC_TEST fail.");

		sendMessage(UnpureTestMessageTypes.EM_PM_TEST, UnpureTestConst.EM_PM);
		AssertExpress.isTrue(UnpureTestConst.EM_PM.isDone, "EC_EM_TEST fail.");
	}

	public function handle_EC_EM_Test(testParam:UnpureTestVo):void {
		testParam.compleate();
	}

	public function handle_EP_EM_Test(testParam:UnpureTestVo):void {
		testParam.compleate();
	}

	public function handle_EM_EM_Test(testParam:UnpureTestVo):void {
		testParam.compleate();
	}

	public function handle_PC_EM_Test(testParam:UnpureTestVo):void {
		testParam.compleate();
	}

	public function handle_PP_EM_Test(testParam:UnpureTestVo):void {
		testParam.compleate();
	}

	public function handle_PM_EM_Test(testParam:UnpureTestVo):void {
		testParam.compleate();
	}

	public function handle_PCe_EM_Test(testParam:UnpureTestVo):void {
		testParam.compleate();
	}

	public function handle_PPe_EM_Test(testParam:UnpureTestVo):void {
		testParam.compleate();
	}

	public function handle_PMe_EM_Test(testParam:UnpureTestVo):void {
		testParam.compleate();
	}

	override protected function onRemove():void {

	}
}
}