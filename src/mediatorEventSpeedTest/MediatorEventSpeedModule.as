package mediatorEventSpeedTest {
import mediatorEventSpeedTest.controller.DoMediatorEventSpeedTestCommand;

import flash.display.Sprite;

import mvcexpress.modules.ModuleCore;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class MediatorEventSpeedModule extends Sprite {

	private var module:ModuleCore = new ModuleCore("MediatorEventSpeedModule");

	public function MediatorEventSpeedModule() {

		trace("MediatorEventSpeedModule.onInit");

		module.executeCommand(DoMediatorEventSpeedTestCommand, this);


	}
}
}