package com.mindScriptAct.mvcExpressVisualizer.view {
import com.bit101.components.PushButton;
import com.mindScriptAct.mvcExpressVisualizer.VisualLoggerTestModule;

import mvcexpress.mvc.Mediator;

/**
 * CLASS COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class VisualLoggerTestModuleMediator extends Mediator {
	private var testViewB1Button:PushButton;
	private var testViewB2Button:PushButton;

	[Inject]
	public var view:VisualLoggerTestModule;

	//[Inject]
	//public var myProxy:MyProxy;

	override protected function onRegister():void {
	}

	override protected function onRemove():void {
	}

}
}