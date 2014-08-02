package loggerLiveSample {
import loggerLiveSample.controller.AddTestProxyCommand;
import loggerLiveSample.controller.InitVizualizerProcessCommand;
import loggerLiveSample.controller.RemoveTestProxyCommand;
import loggerLiveSample.messages.VizualizerMessage;
import loggerLiveSample.model.ProcessInjectProxy;
import loggerLiveSample.view.ColorControlMediator;
import loggerLiveSample.view.ColorControls;
import loggerLiveSample.view.LiveVisualizerMediator;
import loggerLiveSample.view.test.TestColorRectangle;
import loggerLiveSample.view.test.TestColorRectangleMediator;

import mvcexpress.extensions.live.modules.ModuleLive;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
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