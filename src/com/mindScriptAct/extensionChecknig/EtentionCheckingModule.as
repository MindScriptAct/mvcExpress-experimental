package com.mindScriptAct.extensionChecknig {
import mvcexpress.modules.ModuleCore;

public class EtentionCheckingModule extends ModuleCore {


	public function EtentionCheckingModule() {
		super("EtentionCheckingModule");
	}


	override protected function onInit():void {

		commandMap.execute(LiveExtentionCheckCommand);

	}

	public function start():void {

	}
}
}
