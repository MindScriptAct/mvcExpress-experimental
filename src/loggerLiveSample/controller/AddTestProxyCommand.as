package loggerLiveSample.controller {
import loggerLiveSample.model.ColorDataProxy;

import mvcexpress.mvc.Command;

/**
 * CLASS COMMENT
 * @author rBanevicius
 */
public class AddTestProxyCommand extends Command {

	//[Inject]
	//public var myProxy:MyProxy;

	public function execute(colorId:String):void {
		proxyMap.map(new ColorDataProxy(colorId), colorId, null);
	}

}
}