package mvcExpressLiveVisualizer {
import mvcExpressLiveVisualizer.controller.AddTestProxyCommand;
import mvcExpressLiveVisualizer.controller.InitVizualizerProcessCommand;
import mvcExpressLiveVisualizer.controller.RemoveTestProxyCommand;
import mvcExpressLiveVisualizer.messages.VizualizerMessage;
import mvcExpressLiveVisualizer.model.ProcessInjectProxy;
import mvcExpressLiveVisualizer.view.ColorControlMediator;
import mvcExpressLiveVisualizer.view.ColorControls;
import mvcExpressLiveVisualizer.view.LiveVisualizerMediator;
import mvcExpressLiveVisualizer.view.test.TestColorRectangle;
import mvcExpressLiveVisualizer.view.test.TestColorRectangleMediator;

import mvcexpress.extensions.live.modules.ModuleLive;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class LiveVisualizerModule extends ModuleLive {

	override protected function onInit():void {
		trace("LiveVisualizerModule.onInit");

	}

	public function start(main:LiveVisualizer):void {
		trace("LiveVisualizerModule.start > main : " + main);

		processMap.setStage(main.stage);

		commandMap.map(VizualizerMessage.ADD_PROXY, AddTestProxyCommand);
		commandMap.map(VizualizerMessage.REMOVE_PROXY, RemoveTestProxyCommand);

		proxyMap.map(new ProcessInjectProxy());

		mediatorMap.map(LiveVisualizer, LiveVisualizerMediator);
		mediatorMap.map(ColorControls, ColorControlMediator);
		mediatorMap.map(TestColorRectangle, TestColorRectangleMediator);

		mediatorMap.mediate(main);

		commandMap.execute(InitVizualizerProcessCommand);
	}

	override protected function onDispose():void {
	}

}
}