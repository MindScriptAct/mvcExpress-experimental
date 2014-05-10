package codeSnippets {
import codeSnippets.controller.SampleCommand;
import codeSnippets.controller.params.ComplexParams;
import codeSnippets.messages.DataMsg;
import codeSnippets.messages.Msg;
import codeSnippets.messages.ViewMsg;
import codeSnippets.model.ISampleEmptyProxy;
import codeSnippets.model.ISampleProxy;
import codeSnippets.model.SampleEmptyProxy;
import codeSnippets.model.SampleProxy;
import codeSnippets.view.SampleAppMediator;

import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class SnippetAppModule extends ModuleCore {
	private var coreInitTime:int;

	////////////////////////////
	// Module constructor.
	// It initiates the framewokr.
	// in most cases you will not use change it,
	// You could just delete it and let superClass handle construction.
	////////////////////////////
	public function SnippetAppModule() {
		super("SnippetAppModule");

		trace("SnippetAppModule.START!");

		CONFIG::debug {

			checkClassStringConstants(Msg, DataMsg, ViewMsg);
		}

		////////////////////////////
		// Proxy
		// - can be maped as already constucted object or class. Class will be automaticaly instantiated.
		// - proxies are mapet to injectClass+name. if dublication occure error is thrown.
		// - order is important if one proxy uses enother proxy.
		////////////////////////////

		proxyMap.map(new SampleEmptyProxy("Simple proxy"));
		proxyMap.map(new SampleEmptyProxy("Interfaced proxy"), ISampleEmptyProxy);
		proxyMap.map(new SampleEmptyProxy("Named proxy"), SampleEmptyProxy, "namedSampleProxy");
		proxyMap.map(new SampleEmptyProxy("Named and interfaced proxy"), ISampleEmptyProxy, "namedSampleInterfacedProxy");

		proxyMap.map(new SampleProxy());
		proxyMap.map(new SampleProxy(), ISampleProxy);
		proxyMap.map(new SampleProxy(), SampleProxy, "testType");
		proxyMap.map(new SampleProxy(), ISampleProxy, "interfaceProxy");

		////////////////////////////
		// View
		// - view classes are maped to mediator classes 1 to 1.
		////////////////////////////

		mediatorMap.map(MvcExpressSnippets, SampleAppMediator);

		// bad maping... (throws error.)
		//mediatorMap.map(Sprite, Sprite);

		// bad execute test...
		//var badCommand:SampleEmptyCommand = new SampleEmptyCommand();
		//badCommand.execute(null);

		////////////////////////////
		// mediatorInjectTest.controller
		////////////////////////////
		commandMap.map(Msg.TEST, SampleCommand);
		//commandMap.unmap(Msg.TEST, SampleCommand);

		commandMap.execute(SampleCommand);
		commandMap.execute(SampleCommand, "single execute parameter");
		commandMap.execute(SampleCommand, new ComplexParams("complex execute parameters"));

		////////////////////////////
		// comunication
		////////////////////////////
		sendMessage(Msg.TEST);
		sendMessage(Msg.TEST, "single message parameter");
		sendMessage(Msg.TEST, new ComplexParams("complex message parameters"));

	}

	public function start(mvcExpressSnippets:MvcExpressSnippets):void {
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