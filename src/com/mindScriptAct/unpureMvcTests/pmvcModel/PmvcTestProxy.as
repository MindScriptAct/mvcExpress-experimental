package com.mindScriptAct.unpureMvcTests.pmvcModel {
import com.mindScriptAct.unpureMvcTests.mvceModel.MvceTest2Proxy;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestConst;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestMessageTypes;

import mvcexpress.extensions.unpuremvc.patterns.facade.UnpureFacade;
import mvcexpress.extensions.unpuremvc.patterns.proxy.UnpureProxy;
import mvcexpress.utils.AssertExpress;

/**
 * An extensions of <code>Proxy</code> class implementing
 * <code>IProxy</code>
 */
public class PmvcTestProxy extends UnpureProxy {
	public static const NAME:String = "PmvcTestProxy";

	/**
	 * Class constructor.
	 *
	 * <p>Passes the <code>Proxy</code> defined NAME to the extended
	 * <code>Proxy</code>
	 */
	public function PmvcTestProxy() {
		super(NAME);
	}

	/**
	 * Override public onRegister() method
	 */
	override protected function onRegister():void {
		trace("PmvcTestProxy registered.");

		var pmvcProxy2:PmvcTest2Proxy = UnpureFacade.getInstance().retrieveProxy(PmvcTest2Proxy.NAME) as PmvcTest2Proxy;
		AssertExpress.isNotNull(pmvcProxy2, "Pmvc proxy failed to get Pmvc proxy.");

		var mvceProxy2:MvceTest2Proxy = UnpureFacade.getInstance().hack_proxyMap.getProxy(MvceTest2Proxy) as MvceTest2Proxy;
		AssertExpress.isNotNull(mvceProxy2, "Pmvc proxy failed to get Mvce proxy.");

	}

	public function doTest():void {
		sendNotification(UnpureTestMessageTypes.PP_EC_TEST, UnpureTestConst.PP_EC);
		AssertExpress.isTrue(UnpureTestConst.PP_EC.isDone, "PC_EC_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PP_EM_TEST, UnpureTestConst.PP_EM);
		AssertExpress.isTrue(UnpureTestConst.PP_EM.isDone, "PC_EM_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PP_PC_TEST, UnpureTestConst.PP_PC);
		AssertExpress.isTrue(UnpureTestConst.PP_PC.isDone, "PC_PC_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PP_PM_TEST, UnpureTestConst.PP_PM);
		AssertExpress.isTrue(UnpureTestConst.PP_PM.isDone, "PC_EM_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PPe_EC_TEST, UnpureTestConst.PPe_EC);
		AssertExpress.isTrue(UnpureTestConst.PPe_EC.isDone, "PCe_EC_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PPe_EM_TEST, UnpureTestConst.PPe_EM);
		AssertExpress.isTrue(UnpureTestConst.PPe_EM.isDone, "PCe_EM_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PPe_PC_TEST, UnpureTestConst.PPe_PC);
		AssertExpress.isTrue(UnpureTestConst.PPe_PC.isDone, "PCe_PC_TEST fail.");

		sendNotification(UnpureTestMessageTypes.PPe_PM_TEST, UnpureTestConst.PPe_PM);
		AssertExpress.isTrue(UnpureTestConst.PPe_PM.isDone, "PCe_EM_TEST fail.");
	}
}
}