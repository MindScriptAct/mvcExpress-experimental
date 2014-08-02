package runTestCodeSnippets.controller.setup {
import runTestCodeSnippets.model.ISampleEmptyProxy;
import runTestCodeSnippets.model.ISampleProxy;
import runTestCodeSnippets.model.SampleEmptyProxy;
import runTestCodeSnippets.model.SampleProxy;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Deril
 */
public class SetupModelCommand extends Command {

	public function execute(blank:Object):void {
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

		var sameSampleProxy:SampleProxy = new SampleProxy()

		//proxyMap.unmap(SampleEmptyProxy);

		proxyMap.map(sameSampleProxy);
		proxyMap.map(sameSampleProxy, ISampleProxy);
		proxyMap.map(sameSampleProxy, SampleProxy, "testType");
		proxyMap.map(sameSampleProxy, ISampleProxy, "interfaceProxy");
	}

}
}
