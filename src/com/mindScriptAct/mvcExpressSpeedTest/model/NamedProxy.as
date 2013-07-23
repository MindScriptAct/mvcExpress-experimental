package com.mindScriptAct.mvcExpressSpeedTest.model {
import mvcexpress.mvc.Proxy;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class NamedProxy extends Proxy implements INamedProxy {

	static private var SINGELTON_COUNT:int = 0;
	public var description:String;

	public function NamedProxy(description:String = "") {
		if (description) {
			this.description = description;
		} else {
			this.description = "Description is autoCreated!! for singelton : " + (++SINGELTON_COUNT);
		}
	}

	public function getSomeData():String {
		return "Some data... and description : " + description;
	}

}
}