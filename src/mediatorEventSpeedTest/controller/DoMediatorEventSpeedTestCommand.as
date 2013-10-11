package mediatorEventSpeedTest.controller {
import mediatorEventSpeedTest.MediatorEventSpeedModule;
import mediatorEventSpeedTest.view.MediatorEventSpeedModuleMediator;

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
