/**
 * Created by Deril on 2014.05.18.
 */
package mediatorInProxyTesting {
import flash.display.Sprite;

public class ProxyInMediatorMain extends Sprite {
	public function ProxyInMediatorMain() {


		var module:ProxyInMediatorModule = new ProxyInMediatorModule();
		module.start(this);
	}
}
}
