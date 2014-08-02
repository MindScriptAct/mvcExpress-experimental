package runTestModularSample.controller {
import runTestModularSample.ModularSample;
import runTestModularSample.constants.ScopeNames;
import runTestModularSample.view.ModularSampleMediator;

import mvcexpress.extensions.scoped.mvc.CommandScoped;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class InitDoModuleSampleCommand extends CommandScoped {

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
