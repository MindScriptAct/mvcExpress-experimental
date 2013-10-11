package codeSnippetsFlex {
import codeSnippetsFlex.controller.SampleFlexCommand;
import codeSnippetsFlex.controller.params.ComplexParamsFlex;
import codeSnippetsFlex.messages.MsgFlex;
import codeSnippetsFlex.messages.ViewMsgFlex;
import codeSnippetsFlex.model.ISampleEmptyFlexProxy;
import codeSnippetsFlex.model.ISampleFlexProxy;
import codeSnippetsFlex.model.SampleEmptyFlexProxy;
import codeSnippetsFlex.model.SampleFlexProxy;
import codeSnippetsFlex.view.SampleFlexAppMediator;
import codeSnippetsFlex.view.flexObj.TestTileFlexWindow;
import codeSnippetsFlex.view.flexObj.TestTileFlexWindowMediator;
import modularSample.msg.DataMsg;

import mvcexpress.extensions.flex.core.MediatorMapFlex;
import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
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
		proxyMap.map(new SampleEmptyFlexProxy("Interfaced proxy"), ISampleEmptyFlexProxy);
		proxyMap.map(new SampleEmptyFlexProxy("Named proxy"), SampleEmptyFlexProxy, "namedSampleProxy");
		proxyMap.map(new SampleEmptyFlexProxy("Named and interfaced proxy"), ISampleEmptyFlexProxy, "namedSampleInterfacedProxy");

		proxyMap.map(new SampleFlexProxy());
		proxyMap.map(new SampleFlexProxy(), ISampleFlexProxy);
		proxyMap.map(new SampleFlexProxy(), SampleFlexProxy, "testType");
		proxyMap.map(new SampleFlexProxy(), ISampleFlexProxy, "interfaceProxy");

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
		// controller
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