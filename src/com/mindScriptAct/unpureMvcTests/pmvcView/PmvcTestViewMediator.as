package com.mindScriptAct.unpureMvcTests.pmvcView {
import com.mindScriptAct.unpureMvcTests.test.UnpureTestMessageTypes;
import com.mindScriptAct.unpureMvcTests.test.UnpureTestVo;
import com.mindScriptAct.unpureMvcTests.testView.UnpureTestView;

import mvcexpress.dlc.unpuremvc.patterns.mediator.UnpureMediator;
import mvcexpress.dlc.unpuremvc.patterns.observer.UnpureNotification;

public class PmvcTestViewMediator extends UnpureMediator {

	public static const NAME:String = "UnpureTestMediator";

	private var view:UnpureTestView;

	public function PmvcTestViewMediator(viewComponent:UnpureTestView) {
		super(NAME);
		view = viewComponent;
	}

	override protected function onRegister():void {
		trace("PmvcTestViewMediator registered:", view);
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