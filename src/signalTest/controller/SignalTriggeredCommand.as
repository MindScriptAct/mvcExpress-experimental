package signalTest.controller {
import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Deril
 */
public class SignalTriggeredCommand extends Command {

	public function execute(testParams:String):void {
		trace("SignalTriggeredCommand.execute:", testParams);
	}

}
}
