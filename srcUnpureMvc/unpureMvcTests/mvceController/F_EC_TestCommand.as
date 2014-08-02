package unpureMvcTests.mvceController {
import unpureMvcTests.mvceModel.MvceTestProxy;
import unpureMvcTests.pmvcModel.PmvcTestProxy;
import unpureMvcTests.test.UnpureTestConst;
import unpureMvcTests.test.UnpureTestMessageTypes;
import unpureMvcTests.test.UnpureTestVo;

import mvcexpress.mvc.Command;
import mvcexpress.utils.AssertExpress;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class F_EC_TestCommand extends Command {


	[Inject]
	public var mvceProxy:MvceTestProxy;

	[Inject(name="PmvcTestProxy")]
	public var pmvcProxy:PmvcTestProxy;


	public function execute(params:UnpureTestVo):void {
		trace("F_EC_TestCommand execute :", getMessageType(), params);

		AssertExpress.equals(params, UnpureTestConst.F_EC, "Mvce command got wrong data.");
		AssertExpress.equals(getMessageType(), UnpureTestMessageTypes.F_EC_TEST, "Mvce command got wrong type.");

		AssertExpress.isNotNull(mvceProxy, "Mvce command failed to get mvce proxy.");

		AssertExpress.isNotNull(pmvcProxy, "Mvce command failed to get pmvc proxy.");

		/////////////////////////////////////////////////////
		params.compleate();


		/////////////////////////////////////////////////////
		sendMessage(UnpureTestMessageTypes.EC_EC_TEST, UnpureTestConst.EC_EC);
		AssertExpress.isTrue(UnpureTestConst.EC_EC.isDone, "EC_EC_TEST fail.");

		sendMessage(UnpureTestMessageTypes.EC_EM_TEST, UnpureTestConst.EC_EM);
		AssertExpress.isTrue(UnpureTestConst.EC_EM.isDone, "EC_EM_TEST fail.");

		sendMessage(UnpureTestMessageTypes.EC_PC_TEST, UnpureTestConst.EC_PC);
		AssertExpress.isTrue(UnpureTestConst.EC_PC.isDone, "EC_PC_TEST fail.");

		sendMessage(UnpureTestMessageTypes.EC_PM_TEST, UnpureTestConst.EC_PM);
		AssertExpress.isTrue(UnpureTestConst.EC_PM.isDone, "EC_EM_TEST fail.");

	}

}
}
