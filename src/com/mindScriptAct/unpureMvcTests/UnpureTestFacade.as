package com.mindScriptAct.unpureMvcTests {
import com.mindScriptAct.unpureMvcTests.mvceController.EC_EC_TestCommand;
import com.mindScriptAct.unpureMvcTests.mvceController.EM_EC_TestCommand;
import com.mindScriptAct.unpureMvcTests.mvceController.EP_EC_TestCommand;
import com.mindScriptAct.unpureMvcTests.mvceController.F_EC_TestCommand;
import com.mindScriptAct.unpureMvcTests.mvceController.PC_EC_TestCommand;
import com.mindScriptAct.unpureMvcTests.mvceController.PM_EC_TestCommand;
import com.mindScriptAct.unpureMvcTests.mvceController.PP_EC_TestCommand;
import com.mindScriptAct.unpureMvcTests.mvceModel.MvceTestProxy;
import com.mindScriptAct.unpureMvcTests.mvceView.MvceTestViewMediator;
import com.mindScriptAct.unpureMvcTests.pmvcController.EC_PC_TestCommand;
import com.mindScriptAct.unpureMvcTests.pmvcController.EM_PC_TestCommand;
import com.mindScriptAct.unpureMvcTests.pmvcController.EP_PC_TestCommand;
import com.mindScriptAct.unpureMvcTests.pmvcController.F_PC_TestCommand;
import com.mindScriptAct.unpureMvcTests.pmvcController.PC_PC_TestCommand;
import com.mindScriptAct.unpureMvcTests.pmvcController.PM_PC_TestCommand;
import com.mindScriptAct.unpureMvcTests.pmvcController.PP_PC_TestCommand;
import com.mindScriptAct.unpureMvcTests.pmvcModel.PmvcTestProxy;
import com.mindScriptAct.unpureMvcTests.pmvcView.PmvcTestViewMediator;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestConst;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestMessageTypes;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestVo;
import com.mindScriptAct.unpureMvcTests.testView.UnpureTestView;

import mvcexpress.dlc.unpuremvc.patterns.facade.UnpureFacade;
import mvcexpress.utils.AssertExpress;
import mvcexpress.utils.checkClassStringConstants;

public class UnpureTestFacade extends UnpureFacade {

	/**
	 * Register Commands with the Controller
	 */
	override protected function initializeController():void {
		super.initializeController();


		registerCommand(UnpureTestMessageTypes.F_PC_TEST, F_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.PC_PC_TEST, PC_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.PP_PC_TEST, PP_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.PM_PC_TEST, PM_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.EC_PC_TEST, EC_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.EP_PC_TEST, EP_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.EM_PC_TEST, EM_PC_TestCommand);

		commandMap.map(UnpureTestMessageTypes.F_EC_TEST, F_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.PC_EC_TEST, PC_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.PP_EC_TEST, PP_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.PM_EC_TEST, PM_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.EC_EC_TEST, EC_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.EP_EC_TEST, EP_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.EM_EC_TEST, EM_EC_TestCommand);


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

		checkClassStringConstants(UnpureTestMessageTypes);


		sendNotification(UnpureTestMessageTypes.F_PC_TEST, UnpureTestConst.F_PC);
		AssertExpress.isTrue(UnpureTestConst.F_PC.isDone, "F_PC_TEST failed.");

		sendNotification(UnpureTestMessageTypes.F_EC_TEST, UnpureTestConst.F_EC);
		AssertExpress.isTrue(UnpureTestConst.F_EC.isDone, "F_EC_TEST failed.");

		sendNotification(UnpureTestMessageTypes.F_PM_TEST, UnpureTestConst.F_PM);
		AssertExpress.isTrue(UnpureTestConst.F_PM.isDone, "F_PM_TEST failed.");

		sendNotification(UnpureTestMessageTypes.F_EM_TEST, UnpureTestConst.F_EM);
		AssertExpress.isTrue(UnpureTestConst.F_EM.isDone, "F_PE_TEST failed.");


		// check if all test are run.

		if (UnpureTestVo.compleateCount != UnpureTestConst.TESTCOUNTER) {
			trace("ERROR: not all test done ", UnpureTestVo.compleateCount, UnpureTestConst.TESTCOUNTER);
		}
	}

}
}
