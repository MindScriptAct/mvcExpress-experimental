package com.mindScriptAct.unpureMvcTests.pmvcView {
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

		];
	}

	override public function handleNotification(note:UnpureNotification):void {
		switch (note.getName()) {
			default:
				break;
		}
	}

}
}