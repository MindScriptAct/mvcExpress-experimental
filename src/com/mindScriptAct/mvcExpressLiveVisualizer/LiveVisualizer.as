package com.mindScriptAct.mvcExpressLiveVisualizer {
import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.utils.setTimeout;

import mvcexpress.modules.ModuleCore;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class LiveVisualizer extends Sprite {

	private var appModule:LiveVisualizerModule;

	private var blankModule:ModuleCore;

	public function LiveVisualizer():void {
		if (stage) {
			init();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(event:Event = null):void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		//
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// vm warm up:
		setTimeout(start, 300);
	}

	private function start():void {

		MvcExpressLogger.init(this.stage, 600, 0, 900, 500, 0.9, true, MvcExpressLogger.ENGINE_TAB);

		////////////////////////////
		// Inits framework.
		////////////////////////////
		appModule = new LiveVisualizerModule();
		////////////////////////////
		// start our application.
		////////////////////////////
		appModule.start(this);

		blankModule = new ModuleCore("blankModule");
	}

}
}