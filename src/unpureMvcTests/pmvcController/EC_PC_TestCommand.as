package unpureMvcTests.pmvcController {
import unpureMvcTests.mvceModel.MvceTestProxy;
import unpureMvcTests.pmvcModel.PmvcTestProxy;
import unpureMvcTests.test.UnpureTestConst;
import unpureMvcTests.test.UnpureTestMessageTypes;
import unpureMvcTests.test.UnpureTestVo;

import mvcexpress.extensions.unpuremvc.patterns.command.UnpureSimpleCommand;
import mvcexpress.extensions.unpuremvc.patterns.facade.UnpureFacade;
import mvcexpress.extensions.unpuremvc.patterns.observer.UnpureNotification;
import mvcexpress.utils.AssertExpress;

/**
 * A <code>ICommand</code> implementation extending <code>SimpleCommand</code>.
 */
public class EC_PC_TestCommand extends UnpureSimpleCommand {

	/**
	 * @param note an <code>INotification</code>
	 */
	override public function execute(note:UnpureNotification):void {
		trace("EC_PC_TestCommand execute :", note.getName(), note.getType(), note.getBody());
		var params:UnpureTestVo = note.getBody() as UnpureTestVo;

		AssertExpress.equals(note.getBody(), UnpureTestConst.EC_PC, "Pmvc command got wrong data.");
		AssertExpress.equals(note.getName(), UnpureTestMessageTypes.EC_PC_TEST, "Pmvc command got wrong type.");


		var pmvcProxy:PmvcTestProxy = UnpureFacade.getInstance().retrieveProxy(PmvcTestProxy.NAME) as PmvcTestProxy;
		AssertExpress.isNotNull(pmvcProxy, "Pmvc command failed to get Pmvc proxy.");

		var mvceProxy:MvceTestProxy = UnpureFacade.getInstance().hack_proxyMap.getProxy(MvceTestProxy) as MvceTestProxy;
		AssertExpress.isNotNull(mvceProxy, "Pmvc command failed to get Mvce proxy.");


		/////////////////////////////////////////////////////
		params.compleate();

	}
}
}