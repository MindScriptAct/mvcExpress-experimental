package com.mindScriptAct.mvcExpressLive.view {
import com.bit101.components.PushButton;
import flash.events.Event;
import mvcexpress.dlc.live.mvc.MediatorLive;

/**
 * CLASS COMMENT
 * @author rBanevicius
 */
public class LiveViewMediator extends MediatorLive {

	[Inject]
	public var view:LiveView;

	public var liveVectorObjects:Vector.<LiveViewTest> = new Vector.<LiveViewTest>();

	override protected function onRegister():void {
		trace("LiveViewMediator.onRegister");

		var obj1:LiveViewTest = new LiveViewTest();
		view.addChild(obj1);
		var obj2:LiveViewTest = new LiveViewTest();
		view.addChild(obj2);

		liveVectorObjects.push(obj1);
		liveVectorObjects.push(obj2);

		provide(liveVectorObjects, "liveViewObjects");

		//setTimeout(addOneMore, 2000);

		var unprovideBtn:PushButton = new PushButton(view, 5, 5, "unprovideTest", handleUnprovideTest);
	}

	private function handleUnprovideTest(event:Event):void {
		unprovide("liveViewObjects");
	}

	public function addOneMore():void {
		var obj1:LiveViewTest = new LiveViewTest();
		view.addChild(obj1);
		liveVectorObjects.push(obj1);
	}

	override protected function onRemove():void {

	}

}
}