package com.mindScriptAct.circularDependenciesTest {
import com.mindScriptAct.circularDependenciesTest.controller.DoCircularDependencyTestCommand;
import com.mindScriptAct.circularDependenciesTest.model.AProxy;
import com.mindScriptAct.circularDependenciesTest.model.BProxy;
import com.mindScriptAct.circularDependenciesTest.model.CProxy;
import com.mindScriptAct.circularDependenciesTest.model.DProxy;
import com.mindScriptAct.circularDependenciesTest.view.TestView;
import com.mindScriptAct.circularDependenciesTest.view.TestViewMediator;
import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;

import mvcexpress.MvcExpress;
import mvcexpress.modules.ModuleCore;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class CircularDepenednyModule extends Sprite {

	private var module:ModuleCore = new ModuleCore("CircularDepenednyModule");

	public function CircularDepenednyModule() {

		MvcExpressLogger.init(this.stage, 0, 0, 900, 500, 0.9, true, MvcExpressLogger.VISUALIZER_TAB);

		module.executeCommand(DoCircularDependencyTestCommand);

	}

}
}