package runTestCodeSnippets {
import runTestCodeSnippets.controller.ManyInjectsCommand;
import runTestCodeSnippets.controller.SampleCommand;
import runTestCodeSnippets.controller.StartModuleTestCommand;
import runTestCodeSnippets.controller.params.ComplexParams;
import runTestCodeSnippets.controller.setup.SetupControllerCommand;
import runTestCodeSnippets.controller.setup.SetupModelCommand;
import runTestCodeSnippets.controller.setup.SetupViewCommand;
import runTestCodeSnippets.messages.DataMsg;
import runTestCodeSnippets.messages.Msg;
import runTestCodeSnippets.messages.ViewMsg;

import mindscriptact.mvcExpressLogger.MvcExpressLogger;

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