package com.mindScriptAct.mvcExpressVisualizer {
import mvcexpress.core.CommandMap;
import mvcexpress.core.MediatorMap;
import mvcexpress.core.ProxyMap;
import mvcexpress.modules.ModuleCore;

public class TestModule extends ModuleCore {

	public function TestModule(moduleName:String = null) {
		super(moduleName);
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
}
}
