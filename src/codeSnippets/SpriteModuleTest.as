package codeSnippets {
import codeSnippets.controller.ManyInjectsCommand;
import codeSnippets.controller.SampleCommand;
import codeSnippets.controller.StartModuleTestCommand;
import codeSnippets.controller.params.ComplexParams;
import codeSnippets.controller.setup.SetupControllerCommand;
import codeSnippets.controller.setup.SetupModelCommand;
import codeSnippets.controller.setup.SetupViewCommand;
import codeSnippets.messages.DataMsg;
import codeSnippets.messages.Msg;
import codeSnippets.messages.ViewMsg;

import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import mvcexpress.MvcExpress;
import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class SpriteModuleTest extends Sprite {

	private var moduleCore:ModuleCore;

	public function SpriteModuleTest() {

		moduleCore = new ModuleCore("SpriteModuleTest");

		CONFIG::debug {
			MvcExpressLogger.init(this.stage, 0, 0, 900, 500, 0.9, true, MvcExpressLogger.VISUALIZER_TAB);
		}

		super();

		trace("SpriteModuleTest.SpriteModuleTest");

		//
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		//


		CONFIG::debug {

			MvcExpress.debugFunction = trace;

			checkClassStringConstants(Msg, DataMsg, ViewMsg);
		}


		// setup model
		moduleCore.commandMap.execute(SetupModelCommand);

		// setup view
		moduleCore.commandMap.execute(SetupViewCommand);


		// setup mediatorInjectTest.controller
		moduleCore.commandMap.execute(SetupControllerCommand);

		moduleCore.commandMap.execute(SampleCommand);
		moduleCore.commandMap.execute(SampleCommand, "single execute parameter");
		moduleCore.commandMap.execute(SampleCommand, new ComplexParams("complex execute parameters"));

		// command with many injects
		moduleCore.commandMap.execute(ManyInjectsCommand);


		////////////////////////////
		// comunication
		////////////////////////////
		moduleCore.sendMessage(Msg.TEST);
		moduleCore.sendMessage(Msg.TEST, "single message parameter");
		moduleCore.sendMessage(Msg.TEST, new ComplexParams("complex message parameters"));

		// start app
		moduleCore.commandMap.execute(StartModuleTestCommand, this);


	}

}
}