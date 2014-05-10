package codeSnippets.controller {
import mvcexpress.mvc.Command;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class SampleEmptyCommand extends Command {


	public function execute(params:Object):void {
		trace("SampleEmptyCommand.execute > params : " + params);
	}

}
}