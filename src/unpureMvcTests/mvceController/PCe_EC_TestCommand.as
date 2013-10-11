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
public class PCe_EC_TestCommand extends Command {


	[Inject]
	public var mvceProxy:MvceTestProxy;

	[Inject(name="PmvcTestProxy")]
	public var pmvcProxy:PmvcTestProxy;


	public function execute(params:UnpureTestVo):void {
		trace("PCe_EC_TestCommand execute :", getMessageType(), params);

		AssertExpress.equals(params, UnpureTestConst.PCe_EC, "Mvce command got wrong data.");
		AssertExpress.equals(getMessageType(), UnpureTestMessageTypes.PCe_EC_TEST, "Mvce command got wrong type.");

		AssertExpress.isNotNull(mvceProxy, "Mvce command failed to get mvce proxy.");

		AssertExpress.isNotNull(pmvcProxy, "Mvce command failed to get pmvc proxy.");

		//
		params.compleate();
	}

}
}
