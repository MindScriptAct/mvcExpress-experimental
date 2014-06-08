package mediatorInProxyTesting {
import flash.display.Sprite;

import mvcexpress.MvcExpress;

import mvcexpress.modules.ModuleCore;

/**
 * TODO:CLASS COMMENT
 * @author Deril
 */
public class ProxyInMediatorModule extends ModuleCore {

	public function ProxyInMediatorModule() {
		super("ProxyInMediatorModule");
	}

	override protected function onInit():void {

	}

	public function start(main:ProxyInMediatorMain):void {

		MvcExpress.usePureMediators = true;


		proxyMap.map(new PIMTestProxy(), null, null, PIMTestProxy);


		mediatorMap.map(ProxyInMediatorMain, PIMMainMediator);

		mediatorMap.mediate(main);


	}

	override protected function onDispose():void {

	}
}
}