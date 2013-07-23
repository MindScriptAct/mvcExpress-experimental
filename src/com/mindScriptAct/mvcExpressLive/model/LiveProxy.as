package com.mindScriptAct.mvcExpressLive.model {
import com.mindScriptAct.mvcExpressLive.processes.ProcessProvideNames;

import flash.geom.Point;

import mvcexpress.dlc.live.mvc.ProxyLive;

/**
 * CLASS COMMENT
 * @author rBanevicius
 */
public class LiveProxy extends ProxyLive {

	private var objectPositions:Vector.<Point> = new Vector.<Point>();

	public function LiveProxy() {

	}

	override protected function onRegister():void {
		trace("LiveProxy.onRegister");

		objectPositions.push(new Point(1, 2), new Point(3, 4));

		provide(objectPositions, ProcessProvideNames.TEST_OBJECT_POINTS);
	}

	override protected function onRemove():void {

	}

}
}