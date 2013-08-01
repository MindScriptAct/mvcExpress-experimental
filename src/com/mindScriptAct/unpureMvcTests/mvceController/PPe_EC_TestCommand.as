package com.mindScriptAct.unpureMvcTests.mvceController {
import com.mindScriptAct.unpureMvcTests.test.UnpureTestConst;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestMessageTypes;
import com.mindScriptAct.unpureMvcTests.mvceModel.MvceTestProxy;
import com.mindScriptAct.unpureMvcTests.pmvcModel.PmvcTestProxy;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestVo;

import mvcexpress.mvc.Command;
import mvcexpress.utils.AssertExpress;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class PPe_EC_TestCommand extends Command {


	[Inject]
	public var mvceProxy:MvceTestProxy;

	[Inject (name="PmvcTestProxy")]
	public var pmvcProxy:PmvcTestProxy;


	public function execute(params:UnpureTestVo):void {
		trace("PPe_EC_TestCommand execute :", getMessageType(), params);

		AssertExpress.equals(params, UnpureTestConst.PPe_EC, "Mvce command got wrong data.");
		AssertExpress.equals(getMessageType(), UnpureTestMessageTypes.PPe_EC_TEST, "Mvce command got wrong type.");

		AssertExpress.isNotNull(mvceProxy, "Mvce command failed to get mvce proxy.");

		AssertExpress.isNotNull(pmvcProxy, "Mvce command failed to get pmvc proxy.");

		//
		params.compleate();
	}

}
}
