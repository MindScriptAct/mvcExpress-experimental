package mediatorInProxyTesting {
import mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Deril
 */
public class PIMMainMediator extends Mediator {

	[Inject]
	public var view:ProxyInMediatorMain;

	[Inject]
	public var proxyTest:PIMTestProxy;

	override protected function onRegister():void {
		trace("ProxyInMediatorMain:", view, proxyTest);

		var test2:PIMTestProxy = proxyMap.getProxy(PIMTestProxy) as PIMTestProxy;

		trace(test2);

	}

	override protected function onRemove():void {

	}
}
}