package unpureMvcTests {
import unpureMvcTests.mvceController.EC_EC_TestCommand;
import unpureMvcTests.mvceController.EM_EC_TestCommand;
import unpureMvcTests.mvceController.EP_EC_TestCommand;
import unpureMvcTests.mvceController.F_EC_TestCommand;
import unpureMvcTests.mvceController.PC_EC_TestCommand;
import unpureMvcTests.mvceController.PCe_EC_TestCommand;
import unpureMvcTests.mvceController.PM_EC_TestCommand;
import unpureMvcTests.mvceController.PMe_EC_TestCommand;
import unpureMvcTests.mvceController.PP_EC_TestCommand;
import unpureMvcTests.mvceController.PPe_EC_TestCommand;
import unpureMvcTests.mvceModel.MvceTest2Proxy;
import unpureMvcTests.mvceModel.MvceTestProxy;
import unpureMvcTests.mvceView.MvceTestView2Mediator;
import unpureMvcTests.mvceView.MvceTestViewMediator;
import unpureMvcTests.pmvcController.EC_PC_TestCommand;
import unpureMvcTests.pmvcController.EM_PC_TestCommand;
import unpureMvcTests.pmvcController.EP_PC_TestCommand;
import unpureMvcTests.pmvcController.F_PC_TestCommand;
import unpureMvcTests.pmvcController.PC_PC_TestCommand;
import unpureMvcTests.pmvcController.PCe_PC_TestCommand;
import unpureMvcTests.pmvcController.PM_PC_TestCommand;
import unpureMvcTests.pmvcController.PMe_PC_TestCommand;
import unpureMvcTests.pmvcController.PP_PC_TestCommand;
import unpureMvcTests.pmvcController.PPe_PC_TestCommand;
import unpureMvcTests.pmvcModel.PmvcTest2Proxy;
import unpureMvcTests.pmvcModel.PmvcTestProxy;
import unpureMvcTests.pmvcView.PmvcTestView2Mediator;
import unpureMvcTests.pmvcView.PmvcTestViewMediator;
import unpureMvcTests.test.UnpureTestConst;
import unpureMvcTests.test.UnpureTestMessageTypes;
import unpureMvcTests.test.UnpureTestVo;
import unpureMvcTests.testView.UnpureTestView;
import unpureMvcTests.testView.UnpureTestView2;

import mvcexpress.extensions.unpuremvc.patterns.facade.UnpureFacade;
import mvcexpress.utils.AssertExpress;
import mvcexpress.utils.checkClassStringConstants;

public class UnpureTestFacade extends UnpureFacade {

	/**
	 * Register Commands with the Controller
	 */
	override protected function initializeController():void {
		super.initializeController();


		registerCommand(UnpureTestMessageTypes.F_PC_TEST, F_PC_TestCommand);

		registerCommand(UnpureTestMessageTypes.EC_PC_TEST, EC_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.EP_PC_TEST, EP_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.EM_PC_TEST, EM_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.PC_PC_TEST, PC_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.PP_PC_TEST, PP_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.PM_PC_TEST, PM_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.PCe_PC_TEST, PCe_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.PPe_PC_TEST, PPe_PC_TestCommand);
		registerCommand(UnpureTestMessageTypes.PMe_PC_TEST, PMe_PC_TestCommand);

		commandMap.map(UnpureTestMessageTypes.F_EC_TEST, F_EC_TestCommand);

		commandMap.map(UnpureTestMessageTypes.EC_EC_TEST, EC_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.EP_EC_TEST, EP_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.EM_EC_TEST, EM_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.PC_EC_TEST, PC_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.PP_EC_TEST, PP_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.PM_EC_TEST, PM_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.PCe_EC_TEST, PCe_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.PPe_EC_TEST, PPe_EC_TestCommand);
		commandMap.map(UnpureTestMessageTypes.PMe_EC_TEST, PMe_EC_TestCommand);
	}

	private var pmvcTestProxy:PmvcTestProxy = new PmvcTestProxy();

	private var mvceTestProxy:MvceTestProxy = new MvceTestProxy();

	override protected function initializeModel():void {
		super.initializeModel();

		registerProxy(new PmvcTest2Proxy());
		proxyMap.map(new MvceTest2Proxy());

		registerProxy(pmvcTestProxy);
		proxyMap.map(mvceTestProxy);
	}

	override protected function initializeView():void {
		super.initializeView();

		var testView2:UnpureTestView2 = new UnpureTestView2();
		registerMediator(new PmvcTestView2Mediator(testView2));
		mediatorMap.mediateWith(testView2, MvceTestView2Mediator);

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

		pmvcTestProxy.doTest();

		mvceTestProxy.doTest();


		// check if all test are run.

		if (UnpureTestVo.compleateCount != UnpureTestConst.TESTCOUNTER) {
			trace("ERROR: not all test done ", UnpureTestVo.compleateCount, UnpureTestConst.TESTCOUNTER);
		} else {
			trace("ALL test done !!!!! ", UnpureTestVo.compleateCount, UnpureTestConst.TESTCOUNTER);
		}
	}

}
}
