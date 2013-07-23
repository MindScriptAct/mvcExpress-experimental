package com.mindScriptAct.mvcExpressLive.processes.timerProc.tasks {
import flash.geom.Point;

import mvcexpress.dlc.live.Task;

/**
 * COMMENT
 * @author rBanevicius
 */
public class ATask extends Task {

	[Inject(name="testObjectPoints")]
	public var pointObjects:Vector.<Point>;

	override public function run():void {
		trace("ATask.run ------- first");


		for (var i:int = 0; i < pointObjects.length; i++) {
			//trace( "pointObjects >>>>>>>>>>>>>>>>>>> : " + pointObjects[i] );
			pointObjects[i].x = Math.floor(Math.random() * 500);
			pointObjects[i].y = Math.floor(Math.random() * 500);
		}
	}

}
}