package com.mindScriptAct.unpureMvcTests.pmvcView {
import com.mindScriptAct.unpureMvcTests.mvceModel.MvceTestProxy;
import com.mindScriptAct.unpureMvcTests.pmvcModel.PmvcTestProxy;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestConst;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestMessageTypes;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestVo;
import com.mindScriptAct.unpureMvcTests.testView.UnpureTestView;

import mvcexpress.dlc.unpuremvc.patterns.facade.UnpureFacade;
import mvcexpress.dlc.unpuremvc.patterns.mediator.UnpureMediator;
import mvcexpress.dlc.unpuremvc.patterns.observer.UnpureNotification;
import mvcexpress.utils.AssertExpress;

public class PmvcTestViewMediator extends UnpureMediator {

	public static const NAME:String = "UnpureTestMediator";

	private var view:UnpureTestView;

	public function PmvcTestViewMediator(viewComponent:UnpureTestView) {
		super(NAME);
		view = viewComponent;
	}

	override protected function onRegister():void {
		trace("PmvcTestViewMediator registered:", view);

		var pmvcProxy:PmvcTestProxy = UnpureFacade.getInstance().retrieveProxy(PmvcTestProxy.NAME) as PmvcTestProxy;
		AssertExpress.isNotNull(pmvcProxy, "Pmvc mediator failed to get Pmvc proxy.");

		var mvceProxy:MvceTestProxy = UnpureFacade.getInstance().hack_proxyMap.getProxy(MvceTestProxy) as MvceTestProxy;
		AssertExpress.isNotNull(mvceProxy, "Pmvc mediator failed to get Mvce proxy.");
	}

	override public function listNotificationInterests():Array {
		return [
			UnpureTestMessageTypes.F_PM_TEST, //
			UnpureTestMessageTypes.EC_PM_TEST, //
			UnpureTestMessageTypes.EP_PM_TEST, //
			UnpureTestMessageTypes.EM_PM_TEST, //
			UnpureTestMessageTypes.PC_PM_TEST, //
			UnpureTestMessageTypes.PP_PM_TEST, //
			UnpureTestMessageTypes.PM_PM_TEST, //
			UnpureTestMessageTypes.PCe_PM_TEST, //
			UnpureTestMessageTypes.PPe_PM_TEST, //
			UnpureTestMessageTypes.PMe_PM_TEST //

		];
	}

	override public function handleNotification(note:UnpureNotification):void {
		var fpmTest:UnpureTestVo = note.getBody() as UnpureTestVo;
		switch (note.getName()) {
			case UnpureTestMessageTypes.F_PM_TEST:
				fpmTest.compleate();

				//////////////////////////////


				sendNotification(UnpureTestMessageTypes.PM_EC_TEST, UnpureTestConst.PM_EC);
				AssertExpress.isTrue(UnpureTestConst.PM_EC.isDone, "PC_EC_TEST fail.");

				sendNotification(UnpureTestMessageTypes.PM_EM_TEST, UnpureTestConst.PM_EM);
				AssertExpress.isTrue(UnpureTestConst.PM_EM.isDone, "PC_EM_TEST fail.");

				sendNotification(UnpureTestMessageTypes.PM_PC_TEST, UnpureTestConst.PM_PC);
				AssertExpress.isTrue(UnpureTestConst.PM_PC.isDone, "PC_PC_TEST fail.");

				sendNotification(UnpureTestMessageTypes.PM_PM_TEST, UnpureTestConst.PM_PM);
				AssertExpress.isTrue(UnpureTestConst.PM_PM.isDone, "PC_EM_TEST fail.");

				sendNotification(UnpureTestMessageTypes.PMe_EC_TEST, UnpureTestConst.PMe_EC);
				AssertExpress.isTrue(UnpureTestConst.PMe_EC.isDone, "PCe_EC_TEST fail.");

				sendNotification(UnpureTestMessageTypes.PMe_EM_TEST, UnpureTestConst.PMe_EM);
				AssertExpress.isTrue(UnpureTestConst.PMe_EM.isDone, "PCe_EM_TEST fail.");

				sendNotification(UnpureTestMessageTypes.PMe_PC_TEST, UnpureTestConst.PMe_PC);
				AssertExpress.isTrue(UnpureTestConst.PMe_PC.isDone, "PCe_PC_TEST fail.");

				sendNotification(UnpureTestMessageTypes.PMe_PM_TEST, UnpureTestConst.PMe_PM);
				AssertExpress.isTrue(UnpureTestConst.PMe_PM.isDone, "PCe_EM_TEST fail.");


				break;
			case UnpureTestMessageTypes.EC_PM_TEST:
				fpmTest.compleate();
				break;
			case UnpureTestMessageTypes.EP_PM_TEST:
				fpmTest.compleate();
				break;
			case UnpureTestMessageTypes.EM_PM_TEST:
				fpmTest.compleate();
				break;
			case UnpureTestMessageTypes.PC_PM_TEST:
				fpmTest.compleate();
				break;
			case UnpureTestMessageTypes.PP_PM_TEST:
				fpmTest.compleate();
				break;
			case UnpureTestMessageTypes.PM_PM_TEST:
				fpmTest.compleate();
				break;
			case UnpureTestMessageTypes.PCe_PM_TEST:
				fpmTest.compleate();
				break;
			case UnpureTestMessageTypes.PPe_PM_TEST:
				fpmTest.compleate();
				break;
			case UnpureTestMessageTypes.PMe_PM_TEST:
				fpmTest.compleate();
				break;
			default:
				break;
		}
	}

}
}