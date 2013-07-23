package com.mindScriptAct.mvcExpressLiveVisualizer.view {
import flash.events.Event;

/**
 * COMMENT
 * @author rBanevicius
 */
public class ColorControlEvent extends Event {
	public var colorId:String;
	static public const ADD:String = "add";
	static public const REMOVE:String = "remove";
	static public const ADDAFTER:String = "addafter";
	static public const DISABLE:String = "disable";
	static public const ENABLE:String = "enable";
	static public const ADD_MEDIATOR:String = "addMediator";
	static public const REMOVE_MEDIATOR:String = "removeMediator";
	static public const ADD_PROXY:String = "addProxy";
	static public const REMOVE_PROXY:String = "removeProxy";
	
	public function ColorControlEvent(type:String, colorId:String) {
		super(type);
		this.colorId = colorId;
	
	}

}
}