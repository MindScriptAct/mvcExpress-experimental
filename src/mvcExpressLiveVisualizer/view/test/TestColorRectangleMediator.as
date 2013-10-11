package mvcExpressLiveVisualizer.view.test {
import mvcExpressLiveVisualizer.constants.ProvideIds;

import mvcexpress.extensions.live.mvc.MediatorLive;

/**
 * CLASS COMMENT
 * @author rBanevicius
 */
public class TestColorRectangleMediator extends MediatorLive {

	[Inject]
	public var view:TestColorRectangle;

	//[Inject]
	//public var myProxy:MyProxy;

	override protected function onRegister():void {

		provide(view.testRectangle, ProvideIds.TESTVIEW + view.colorId);

	}

	override protected function onRemove():void {

	}

}
}