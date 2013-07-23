package com.mindScriptAct.mediatorEventSpeedTest.controller {
import com.mindScriptAct.mediatorEventSpeedTest.MediatorEventSpeedModule;
import com.mindScriptAct.mediatorEventSpeedTest.view.MediatorEventSpeedModuleMediator;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class DoMediatorEventSpeedTestCommand extends Command {

	public function execute(main:MediatorEventSpeedModule):void {

		mediatorMap.map(MediatorEventSpeedModule, MediatorEventSpeedModuleMediator);

		mediatorMap.mediate(main);
	}

}
}
