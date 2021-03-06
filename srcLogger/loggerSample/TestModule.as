package loggerSample {
import mvcexpress.core.CommandMap;
import mvcexpress.core.MediatorMap;
import mvcexpress.core.ProxyMap;
import mvcexpress.modules.ModuleCore;

public class TestModule extends ModuleCore {
	public function TestModule(moduleName:String = null, mediatorMapClass:Class = null, proxyMapClass:Class = null, commandMapClass:Class = null, messengerClass:Class = null) {
		super(moduleName, mediatorMapClass, proxyMapClass, commandMapClass, messengerClass);
	}


	public function get testCommandMap():CommandMap {
		return commandMap;
	}

	public function get testProxyMap():ProxyMap {
		return proxyMap;
	}

	public function get testMediatorMap():MediatorMap {
		return mediatorMap;
	}

    public function testListing():void {

        trace(listMappedMessages(false));
        trace(listMappedMediators(false));
        trace(listMappedProxies(false));
        trace(listMappedCommands(false));
    }
}
}
