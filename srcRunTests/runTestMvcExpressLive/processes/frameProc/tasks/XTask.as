package runTestMvcExpressLive.processes.frameProc.tasks {
import com.bit101.components.Panel;

import mvcexpress.extensions.live.engine.Task;

/**
 * COMMENT
 * @author rBanevicius
 */
public class XTask extends Task {

	[Inject(name="guiPanelTest")]
	public var panel:Panel;

	override public function run():void {
		trace("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! XTask.run", panel.x);
		panel.x += 10;
		panel.y += 10;
	}

}
}