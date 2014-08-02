package runTestModularSample {
import mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import runTestModularSample.controller.InitDoModuleSampleCommand;
import runTestModularSample.msg.DataMsg;
import runTestModularSample.msg.Msg;
import runTestModularSample.msg.ViewMsg;

import mvcexpress.extensions.scoped.modules.ModuleScoped;
import mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
[SWF(width="1200", height="786", frameRate="60")]
public class ModularSample extends Sprite {

	public var module:ModuleScoped = new ModuleScoped("ModularSample");

	public function ModularSample() {
		CONFIG::debug {
			checkClassStringConstants(Msg, DataMsg, ViewMsg);
			MvcExpressLogger.init(this.stage, 700, 0, 800, 400, 1, true);
		}

		//
		this.stage.align = StageAlign.TOP_LEFT;
		this.stage.scaleMode = StageScaleMode.NO_SCALE;


		module.commandMap.execute(InitDoModuleSampleCommand, this);

	}

}
}