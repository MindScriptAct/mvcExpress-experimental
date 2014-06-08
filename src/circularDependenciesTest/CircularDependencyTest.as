package circularDependenciesTest {
import circularDependenciesTest.controller.DoCircularDependencyTestCommand;

import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;

import mvcexpress.modules.ModuleCore;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class CircularDependencyTest extends Sprite {

	private var module:ModuleCore = new ModuleCore("CircularDependencyTest");

	public function CircularDependencyTest() {

		MvcExpressLogger.init(this.stage, 0, 0, 900, 500, 0.9, true, MvcExpressLogger.VISUALIZER_TAB);

		module.commandMap.execute(DoCircularDependencyTestCommand);

	}

}
}