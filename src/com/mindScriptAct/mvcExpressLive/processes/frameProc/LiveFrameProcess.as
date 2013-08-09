package com.mindScriptAct.mvcExpressLive.processes.frameProc {
import com.mindScriptAct.mvcExpressLive.processes.frameProc.tasks.XTask;

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