package runTestMvcExpressLive.processes.timerProc {
import runTestMvcExpressLive.messages.LiveMesasge;
import runTestMvcExpressLive.processes.timerProc.tasks.ATask;
import runTestMvcExpressLive.processes.timerProc.tasks.BTask;
import runTestMvcExpressLive.processes.timerProc.tasks.C1Task;
import runTestMvcExpressLive.processes.timerProc.tasks.C2Task;
import runTestMvcExpressLive.processes.timerProc.tasks.D1Task;

import mvcexpress.extensions.live.engine.Process;

/**
 * COMMENT
 * @author rBanevicius
 */
public class LiveTimerProcess extends Process {

	override protected function onRegister():void {

		this.addTask(ATask);
		this.addTask(BTask);
		this.addTask(C1Task);
		this.addTask(C2Task);
		this.addTask(D1Task);

		addHandler(LiveMesasge.STOP_SQUARES, handleStopSquares);
		addHandler(LiveMesasge.START_SQUARES, handleStartSquares);
	}

	private function handleStartSquares(blank:Object):void {
		trace("LiveTimerProcess.handleStartSquares > blank : " + blank);
		//aTask.insertTask(bTask);
		//bTask.insertTask(c1Task);
	}

	private function handleStopSquares(blank:Object):void {
		trace("LiveTimerProcess.handleStopSquares > blank : " + blank);
		//bTask.remove();
		//c1Task.remove();
	}

}
}