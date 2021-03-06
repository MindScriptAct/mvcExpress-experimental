package unpureMvcTests.pmvcModel {
import mvcexpress.extensions.unpuremvc.patterns.proxy.UnpureProxy;

/**
 * An extensions of <code>Proxy</code> class implementing
 * <code>IProxy</code>
 */
public class PmvcTest2Proxy extends UnpureProxy {
	public static const NAME:String = "PmvcTest2Proxy";

	/**
	 * Class constructor.
	 *
	 * <p>Passes the <code>Proxy</code> defined NAME to the extended
	 * <code>Proxy</code>
	 */
	public function PmvcTest2Proxy() {
		super(NAME);
	}

	/**
	 * Override public onRegister() method
	 */
	override protected function onRegister():void {
		trace("PmvcTest2Proxy registered.")
	}

}
}