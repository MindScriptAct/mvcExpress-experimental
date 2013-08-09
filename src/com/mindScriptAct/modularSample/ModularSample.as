package com.mindScriptAct.modularSample {
import com.mindScriptAct.modularSample.controller.InitDoModuleSampleCommand;
import com.mindScriptAct.modularSample.msg.DataMsg;
import com.mindScriptAct.modularSample.msg.Msg;
import com.mindScriptAct.modularSample.msg.ViewMsg;
import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import mvcexpress.extensions.scoped.modules.ModuleScoped;
import mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
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


		module.executeCommand(InitDoModuleSampleCommand, this);

	}

}
}