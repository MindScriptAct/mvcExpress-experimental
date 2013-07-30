package com.mindScriptAct.unpureMvcTests.pmvcController {
import com.mindScriptAct.unpureMvcTests.constants.UnpureTestConst;
import com.mindScriptAct.unpureMvcTests.constants.UnpureTestMessageTypes;
import com.mindScriptAct.unpureMvcTests.pmvcModel.PmvcTestProxy;

import mvcexpress.dlc.unpuremvc.patterns.command.UnpureSimpleCommand;
import mvcexpress.dlc.unpuremvc.patterns.facade.UnpureFacade;
import mvcexpress.dlc.unpuremvc.patterns.observer.UnpureNotification;
import mvcexpress.utils.AssertExpress;

/**
 * A <code>ICommand</code> implementation extending <code>SimpleCommand</code>.
 */
public class PmvcTestCommand extends UnpureSimpleCommand {

	/**
	 * @param note an <code>INotification</code>
	 */
	override public function execute(note:UnpureNotification):void {
		trace("UnpureTestStartupCommand execute :", note.getName(), note.getType(), note.getBody());

		AssertExpress.equals(note.getBody(), UnpureTestConst.TEST_DATA, "Pmvc command got wrong data.");
		AssertExpress.equals(note.getName(), UnpureTestMessageTypes.PtoP_COMMAND_TEST, "Pmvc command got wrong type.");


		var pmvcProxy:PmvcTestProxy = UnpureFacade.getInstance().retrieveProxy(PmvcTestProxy.NAME) as PmvcTestProxy;

		AssertExpress.isNotNull(pmvcProxy, "Pmvc command failed to get Pmvc proxy.");

	}
}
}