package mvcExpressLiveVisualizer.engine {
import mvcExpressLiveVisualizer.model.TestColorVO;

import flash.display.Shape;

import mvcexpress.extensions.live.engine.Task;

/**
 * COMMENT
 * @author rBanevicius
 */
public class BlueTask extends Task {

	[Inject(name="testview_BLUE")]
	public var testRectangle:Shape;

	[Inject(name="testdata_BLUE")]
	public var testData:TestColorVO;

	[Inject(name="testdata_ALL")]
	public var outData:TestColorVO;

	override public function run():void {
		testRectangle.rotation += 10;
	}

}
}