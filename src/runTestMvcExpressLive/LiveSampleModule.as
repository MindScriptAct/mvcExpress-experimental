package runTestMvcExpressLive {
import com.bit101.components.PushButton;
import runTestMvcExpressLive.contreller.setUp.InitProcessCommand;
import runTestMvcExpressLive.messages.LiveMesasge;
import runTestMvcExpressLive.model.LiveProxy;
import runTestMvcExpressLive.mvcCore.MediatorMapLiveFlex;
import runTestMvcExpressLive.view.LiveView;
import runTestMvcExpressLive.view.LiveViewMediator;
import runTestMvcExpressLive.view.guiTest.LiveGuiTest;
import runTestMvcExpressLive.view.guiTest.LiveGuiTestMediator;

import flash.events.Event;

import mvcexpress.extensions.live.modules.ModuleLive;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class LiveSampleModule extends ModuleLive {

	override protected function onInit():void {
		trace("LiveSampleModule.onInit", MediatorMapLiveFlex);

	}

	public function start(main:LiveSample):void {
		trace("LiveSampleModule.start > main : " + main);

		processMap.setStage(main.stage);

		proxyMap.map(new LiveProxy());

		var liveView:LiveView = new LiveView();
		main.addChild(liveView);
		mediatorMap.map(LiveView, LiveViewMediator);
		mediatorMap.mediate(liveView);

		var liveGuiTest:LiveGuiTest = new LiveGuiTest();
		main.addChild(liveGuiTest);
		mediatorMap.mediateWith(liveGuiTest, LiveGuiTestMediator);

		commandMap.execute(InitProcessCommand);

		var testButton1:PushButton = new PushButton(main, 600, 510, "stopSwuares", handleStopSquares);
		var testButton2:PushButton = new PushButton(main, 600, 530, "startSwuares", handleStartSquares);
	}

	private function handleStopSquares(event:Event):void {
		sendMessage(LiveMesasge.STOP_SQUARES);
	}

	private function handleStartSquares(event:Event):void {
		sendMessage(LiveMesasge.START_SQUARES);

	}

	override protected function onDispose():void {
	}

}
}