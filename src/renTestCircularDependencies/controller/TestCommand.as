package renTestCircularDependencies.controller {
import renTestCircularDependencies.model.AProxy;
import renTestCircularDependencies.model.BProxy;
import renTestCircularDependencies.model.CProxy;

import mvcexpress.mvc.Command;

/**
 * CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class TestCommand extends Command {

	[Inject]
	public var aProxy:AProxy;

	[Inject]
	public var bProxy:BProxy;

	[Inject]
	public var cProxy:CProxy;

	public function execute(params:Object):void {
		trace("TestCommand.execute > params : " + params);

		trace("3 proxy data multyplication is: " + int(aProxy.data * bProxy.data * cProxy.data));

	}

}
}