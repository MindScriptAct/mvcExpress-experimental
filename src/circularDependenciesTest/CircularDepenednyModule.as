package circularDependenciesTest {
import circularDependenciesTest.controller.DoCircularDependencyTestCommand;

import mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;

import mvcexpress.modules.ModuleCore;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class CircularDepenednyModule extends Sprite {

	private var module:ModuleCore = new ModuleCore("CircularDepenednyModule");

	public function CircularDepenednyModule() {

		MvcExpressLogger.init(this.stage, 0, 0, 900, 500, 0.9, true, MvcExpressLogger.VISUALIZER_TAB);

		module.commandMap.execute(DoCircularDependencyTestCommand);

	}

}
}