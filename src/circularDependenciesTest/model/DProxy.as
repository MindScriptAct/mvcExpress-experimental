package circularDependenciesTest.model {
import mvcexpress.mvc.Proxy;

/**
 * CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class DProxy extends Proxy {


	[Inject]
	public var deadProxy:DeadProxy;


	public function DProxy() {

	}

	override protected function onRegister():void {

	}

	override protected function onRemove():void {

	}

}
}