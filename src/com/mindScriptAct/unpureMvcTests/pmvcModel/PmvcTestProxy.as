package com.mindScriptAct.unpureMvcTests.pmvcModel {
import mvcexpress.dlc.unpuremvc.patterns.proxy.UnpureProxy;

/**
 * An extension of <code>Proxy</code> class implementing
 * <code>IProxy</code>
 */
public class PmvcTestProxy extends UnpureProxy {
	public static const NAME:String = "PmvcTestProxy";

	/**
	 * Class constructor.
	 *
	 * <p>Passes the <code>Proxy</code> defined NAME to the extended
	 * <code>Proxy</code>
	 */
	public function PmvcTestProxy() {
		super(NAME);
	}

	/**
	 * Override public onRegister() method
	 */
	override protected function onRegister():void {
	 	trace("PmvcTestProxy registered.")
	}
}
}