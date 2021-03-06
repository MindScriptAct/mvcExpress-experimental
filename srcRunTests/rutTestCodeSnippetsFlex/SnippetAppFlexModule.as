package rutTestCodeSnippetsFlex {
import rutTestCodeSnippetsFlex.controller.SampleFlexCommand;
import rutTestCodeSnippetsFlex.controller.params.ComplexParamsFlex;
import rutTestCodeSnippetsFlex.messages.MsgFlex;
import rutTestCodeSnippetsFlex.messages.ViewMsgFlex;
import rutTestCodeSnippetsFlex.model.ISampleEmptyFlexProxy;
import rutTestCodeSnippetsFlex.model.ISampleFlexProxy;
import rutTestCodeSnippetsFlex.model.SampleEmptyFlexProxy;
import rutTestCodeSnippetsFlex.model.SampleFlexProxy;
import rutTestCodeSnippetsFlex.view.SampleFlexAppMediator;
import rutTestCodeSnippetsFlex.view.flexObj.TestTileFlexWindow;
import rutTestCodeSnippetsFlex.view.flexObj.TestTileFlexWindowMediator;

import runTestModularSample.msg.DataMsg;

import mvcexpress.extensions.flex.core.MediatorMapFlex;
import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class SnippetAppFlexModule extends ModuleCore {
	private var coreInitTime:int;

	////////////////////////////
	// Module constructor.
	// It initiates the framewokr.
	// in most cases you will not use change it,
	// You could just delete it and let superClass handle construction.
	////////////////////////////
	public function SnippetAppFlexModule() {
		super("SnippetAppModule", MediatorMapFlex);

		trace("SnippetAppModule.START!");

		CONFIG::debug {

			checkClassStringConstants(MsgFlex, DataMsg, ViewMsgFlex);
		}

		////////////////////////////
		// Proxy
		// - can be maped as already constucted object or class. Class will be automaticaly instantiated.
		// - proxies are mapet to injectClass+name. if dublication occure error is thrown.
		// - order is important if one proxy uses enother proxy.
		////////////////////////////

		proxyMap.map(new SampleEmptyFlexProxy("Simple proxy"));
		proxyMap.map(new SampleEmptyFlexProxy("Interfaced proxy"), null, ISampleEmptyFlexProxy);
		proxyMap.map(new SampleEmptyFlexProxy("Named proxy"), "namedSampleProxy", SampleEmptyFlexProxy);
		proxyMap.map(new SampleEmptyFlexProxy("Named and interfaced proxy"), "namedSampleInterfacedProxy", ISampleEmptyFlexProxy);

		proxyMap.map(new SampleFlexProxy());
		proxyMap.map(new SampleFlexProxy(), null, ISampleFlexProxy);
		proxyMap.map(new SampleFlexProxy(), "testType", SampleFlexProxy);
		proxyMap.map(new SampleFlexProxy(), "interfaceProxy", ISampleFlexProxy);

		////////////////////////////
		// View
		// - view classes are maped to mediator classes 1 to 1.
		////////////////////////////

		mediatorMap.map(MvcExpressFlexSnippets, SampleFlexAppMediator);
		mediatorMap.map(TestTileFlexWindow, TestTileFlexWindowMediator);

		// bad maping... (throws error.)
		//mediatorMap.map(Sprite, Sprite);

		// bad execute test...
		//var badCommand:SampleEmptyCommand = new SampleEmptyCommand();
		//badCommand.execute(null);

		////////////////////////////
		// mediatorInjectTest.controller
		////////////////////////////
		commandMap.map(MsgFlex.TEST, SampleFlexCommand);
		//commandMap.unmap(Msg.TEST, SampleCommand);

		commandMap.execute(SampleFlexCommand);
		commandMap.execute(SampleFlexCommand, "single execute parameter");
		commandMap.execute(SampleFlexCommand, new ComplexParamsFlex("complex execute parameters"));

		////////////////////////////
		// comunication
		////////////////////////////
		sendMessage(MsgFlex.TEST);
		sendMessage(MsgFlex.TEST, "single message parameter");
		sendMessage(MsgFlex.TEST, new ComplexParamsFlex("complex message parameters"));

	}

	public function start(mvcExpressSnippets:MvcExpressFlexSnippets):void {
		////////////////////////////
		// start application...
		// - mediate mainView object
		// AND
		// - execute commands OR send test if needed.
		////////////////////////////


		mediatorMap.mediate(mvcExpressSnippets);
		//mediatorMap.unmediate(mvcExpressSnippets);


		//mediatorMap.mediateWith(mvcExpressSnippets.stage, KeyboardMediator);

	}

	////////////////////////////
	// called just before module is disposed to put your clean-up code here.
	// Main module don't need this function as it is never shutDown.
	////////////////////////////
	override protected function onDispose():void {
		// dispose module
	}

}
}