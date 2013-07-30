package com.mindScriptAct.unpureMvcTests.mvceController {
import com.mindScriptAct.unpureMvcTests.constants.UnpureTestConst;
import com.mindScriptAct.unpureMvcTests.constants.UnpureTestMessageTypes;
import com.mindScriptAct.unpureMvcTests.mvceModel.MvceTestProxy;
import com.mindScriptAct.unpureMvcTests.pmvcModel.PmvcTestProxy;

import mvcexpress.mvc.Command;
import mvcexpress.utils.AssertExpress;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class MvceTestCommand extends Command {


	[Inject]
	public var mvceProxy:MvceTestProxy;

//	[Inject]
//	public var pmvcProxy:PmvcTestProxy;


	public function execute(params:Object):void {
		trace("MvceTestCommand execute :", getMessageType(), params);

		AssertExpress.equals(params, UnpureTestConst.TEST_DATA, "Mvce command got wrong data.");
		AssertExpress.equals(getMessageType(), UnpureTestMessageTypes.PtoE_COMMAND_TEST, "Mvce command got wrong type.");

		AssertExpress.isNotNull(mvceProxy, "Mvce command failed to get mvce proxy.");

//		AssertExpress.isNotNull(pmvcProxy, "Mvce command failed to get pmvc proxy.");
	}

}
}
