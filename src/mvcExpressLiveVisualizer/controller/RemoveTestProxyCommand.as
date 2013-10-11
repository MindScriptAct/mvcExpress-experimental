package mvcExpressLiveVisualizer.controller {
import mvcExpressLiveVisualizer.model.ColorDataProxy;

import mvcexpress.mvc.Command;

/**
 * CLASS COMMENT
 * @author rBanevicius
 */
public class RemoveTestProxyCommand extends Command {

	//[Inject]
	//public var myProxy:MyProxy;

	public function execute(colorId:String):void {
		proxyMap.unmap(ColorDataProxy, colorId);
	}

}
}