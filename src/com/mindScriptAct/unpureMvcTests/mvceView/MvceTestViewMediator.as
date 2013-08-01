package com.mindScriptAct.unpureMvcTests.mvceView {
import com.mindScriptAct.unpureMvcTests.test.UnpureTestMessageTypes;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestVo;
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