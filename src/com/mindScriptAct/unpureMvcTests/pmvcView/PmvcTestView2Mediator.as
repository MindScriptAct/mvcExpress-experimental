package com.mindScriptAct.unpureMvcTests.pmvcView {
import com.mindScriptAct.unpureMvcTests.testView.UnpureTestView;
import com.mindScriptAct.unpureMvcTests.testView.UnpureTestView2;

import mvcexpress.dlc.unpuremvc.patterns.mediator.UnpureMediator;
import mvcexpress.dlc.unpuremvc.patterns.observer.UnpureNotification;

public class PmvcTestView2Mediator extends UnpureMediator {

	public static const NAME:String = "UnpureTest2Mediator";

	private var view:UnpureTestView2;

	public function PmvcTestView2Mediator(viewComponent:UnpureTestView2) {
		super(NAME);
		view = viewComponent;
	}

	override protected function onRegister():void {
		trace("PmvcTestView2Mediator registered:", view);
	}

	override public function listNotificationInterests():Array {
		return [
		];
	}

	override public function handleNotification(note:UnpureNotification):void {

	}
}
}


