package mediatorEventSpeedTest {
import mediatorEventSpeedTest.controller.DoMediatorEventSpeedTestCommand;

import flash.display.Sprite;

import mvcexpress.modules.ModuleCore;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class MediatorEventSpeedModule extends Sprite {

	private var module:ModuleCore = new ModuleCore("MediatorEventSpeedModule");

	public function MediatorEventSpeedModule() {

		trace("MediatorEventSpeedModule.onInit");

		module.commandMap.execute(DoMediatorEventSpeedTestCommand, this);


	}
}
}