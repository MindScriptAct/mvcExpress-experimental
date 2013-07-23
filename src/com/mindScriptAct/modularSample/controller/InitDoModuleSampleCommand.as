package com.mindScriptAct.modularSample.controller {
import com.mindScriptAct.modularSample.ModularSample;
import com.mindScriptAct.modularSample.constants.ScopeNames;
import com.mindScriptAct.modularSample.view.ModularSampleMediator;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class InitDoModuleSampleCommand extends Command {

	public function execute(main:ModularSample):void {


		trace("ModularSampleShellModule.onInit");

		registerScope(ScopeNames.FIRST_SCOPE);
		registerScope(ScopeNames.EVEN_SCOPE);
		registerScope(ScopeNames.ALL_SCORE);


		mediatorMap.map(ModularSample, ModularSampleMediator);

		mediatorMap.mediate(main);

	}

}
}
