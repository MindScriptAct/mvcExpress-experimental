package com.mindScriptAct.unpureMvcTests {
import com.mindScriptAct.unpureMvcTests.constants.UnpureTestConst;
import com.mindScriptAct.unpureMvcTests.constants.UnpureTestMessageTypes;
import com.mindScriptAct.unpureMvcTests.mvceController.MvceTestCommand;
import com.mindScriptAct.unpureMvcTests.mvceModel.MvceTestProxy;
import com.mindScriptAct.unpureMvcTests.mvceView.MvceTestViewMediator;
import com.mindScriptAct.unpureMvcTests.pmvcController.PmvcTestCommand;
import com.mindScriptAct.unpureMvcTests.pmvcModel.PmvcTestProxy;
import com.mindScriptAct.unpureMvcTests.pmvcView.PmvcTestViewMediator;
import com.mindScriptAct.unpureMvcTests.testView.UnpureTestView;

import mvcexpress.dlc.unpuremvc.patterns.facade.UnpureFacade;

public class UnpureTestFacade extends UnpureFacade {

	/**
	 * Register Commands with the Controller
	 */
	override protected function initializeController():void {
		super.initializeController();
		registerCommand(UnpureTestMessageTypes.PtoP_COMMAND_TEST, PmvcTestCommand);
		commandMap.map(UnpureTestMessageTypes.PtoE_COMMAND_TEST, MvceTestCommand)
	}

	override protected function initializeModel():void {
		super.initializeModel();
		registerProxy(new PmvcTestProxy());

		proxyMap.map(new MvceTestProxy())
	}

	override protected function initializeView():void {
		super.initializeView();
		var testView:UnpureTestView = new UnpureTestView();

		registerMediator(new PmvcTestViewMediator(testView));
		mediatorMap.map(UnpureTestView, MvceTestViewMediator);

		mediatorMap.mediate(testView);
	}


	/**
	 * Start the application
	 */
	public function startup(main:UnpureTestMain):void {
		trace("UnpureTestFacade strtup :", main);

		sendNotification(UnpureTestMessageTypes.PtoP_COMMAND_TEST, UnpureTestConst.TEST_DATA);

		sendNotification(UnpureTestMessageTypes.PtoE_COMMAND_TEST, UnpureTestConst.TEST_DATA);
	}

}
}
