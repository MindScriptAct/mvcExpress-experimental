package loggerLiveSample.engine {
import loggerLiveSample.model.TestColorVO;

import flash.display.Shape;

import mvcexpress.extensions.live.engine.Task;

/**
 * COMMENT
 * @author rBanevicius
 */
public class RedTask extends Task {

	[Inject(name="testview_RED")]
	public var testRectangle:Shape;

	[Inject(name="testdata_RED")]
	public var testData:TestColorVO;

	[Inject(name="testdata_ALL")]
	public var outData:TestColorVO;

	override public function run():void {
		testRectangle.rotation += 10;
	}

}
}