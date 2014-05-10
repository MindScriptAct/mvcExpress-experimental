package modules.console.model {
import modules.console.msg.ConsoleDataMsg;

import mvcexpress.mvc.Proxy;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class ConsoleLogProxy extends Proxy {

	private var messageList:Vector.<String> = new Vector.<String>();
	private var _consoleId:int;

	public function ConsoleLogProxy(_consoleId:int) {
		this._consoleId = _consoleId;
	}

	public function pushMessage(messageText:String):void {
		messageList.push(messageText);
		sendMessage(ConsoleDataMsg.MESSAGE_ADDED, messageText);
	}

	override protected function onRegister():void {
		trace("ConsoleLogProxy.onRegister");
	}

	override protected function onRemove():void {
		trace("ConsoleLogProxy.onRemove");
	}

	public function get consoleId():int {
		return _consoleId;
	}

}
}