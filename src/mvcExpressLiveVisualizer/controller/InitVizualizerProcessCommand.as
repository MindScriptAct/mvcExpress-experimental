package mvcExpressLiveVisualizer.controller {
import mvcExpressLiveVisualizer.engine.VisualizerProcess;

import mvcexpress.extensions.live.mvc.CommandLive;

/**
 * CLASS COMMENT
 * @author rBanevicius
 */
public class InitVizualizerProcessCommand extends CommandLive {

	//[Inject]
	//public var myProxy:MyProxy;

	public function execute(blank:Object):void {

		processMap.mapTimerProcess(VisualizerProcess, 100);

		processMap.startProcess(VisualizerProcess);


	}

}
}