package runTestMvcExpressLive.processes.frameProc {
import runTestMvcExpressLive.processes.frameProc.tasks.XTask;

import mvcexpress.extensions.live.engine.Process;

/**
 * COMMENT
 * @author rBanevicius
 */
public class LiveFrameProcess extends Process {

	override protected function onRegister():void {
		this.addTask(XTask);
	}

}
}