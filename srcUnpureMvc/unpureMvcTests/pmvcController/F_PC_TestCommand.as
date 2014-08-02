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
public class F_PC_TestCommand extends UnpureSimpleCommand {

	/**
	 * @param note an <code>INotification</code>
	 */
	override public function execute(note:UnpureNotification):void {
		trace("F_PC_TestCommand execute :", note.getName(), note.getType(), note.getBody());

		var params:UnpureTestVo = note.getBody() as UnpureTestVo;

		AssertExpress.equals(note.getBody(), UnpureTestConst.F_PC, "Pmvc command got wrong data.");
		AssertExpress.equals(note.getName(), UnpureTestMessageTypes.F_PC_TEST, "Pmvc command got wrong type.");


		var pmvcProxy:PmvcTestProxy = UnpureFacade.getInstance().retrieveProxy(PmvcTestProxy.NAME) as PmvcTestProxy;
		AssertExpress.isNotNull(pmvcProxy, "Pmvc command failed to get Pmvc proxy.");

		var mvceProxy:MvceTestProxy = UnpureFacade.getInstance().hack_proxyMap.getProxy(MvceTestProxy) as MvceTestProxy;
		AssertExpress.isNotNull(mvceProxy, "Pmvc command failed to get Mvce proxy.");


		/////////////////////////////////////////////////////
		params.compleate();

		/////////////////////////////////////////////////////
		sendNotification(UnpureTestMessageTypes.PC_EC_TEST, UnpureTestConst.PC_EC);
		AssertExpress.isTrue(UnpureTestConst.PC_EC.isDone, "PC_EC_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PC_EM_TEST, UnpureTestConst.PC_EM);
		AssertExpress.isTrue(UnpureTestConst.PC_EM.isDone, "PC_EM_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PC_PC_TEST, UnpureTestConst.PC_PC);
		AssertExpress.isTrue(UnpureTestConst.PC_PC.isDone, "PC_PC_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PC_PM_TEST, UnpureTestConst.PC_PM);
		AssertExpress.isTrue(UnpureTestConst.PC_PM.isDone, "PC_EM_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PCe_EC_TEST, UnpureTestConst.PCe_EC);
		AssertExpress.isTrue(UnpureTestConst.PCe_EC.isDone, "PCe_EC_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PCe_EM_TEST, UnpureTestConst.PCe_EM);
		AssertExpress.isTrue(UnpureTestConst.PCe_EM.isDone, "PCe_EM_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PCe_PC_TEST, UnpureTestConst.PCe_PC);
		AssertExpress.isTrue(UnpureTestConst.PCe_PC.isDone, "PCe_PC_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PCe_PM_TEST, UnpureTestConst.PCe_PM);
		AssertExpress.isTrue(UnpureTestConst.PCe_PM.isDone, "PCe_EM_TEST fail.");

	}
}
}