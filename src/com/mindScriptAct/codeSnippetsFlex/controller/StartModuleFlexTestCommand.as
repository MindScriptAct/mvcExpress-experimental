package com.mindScriptAct.codeSnippetsFlex.controller {
import com.mindScriptAct.codeSnippets.SpriteModuleTest;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Deril
 */
public class StartModuleFlexTestCommand extends Command {

	public function execute(main:SpriteModuleTest):void {
		////////////////////////////
		// start application...
		// - mediate mainView object
		// AND
		// - execute commands OR send messages if needed.
		////////////////////////////

		mediatorMap.mediate(main);
		//mediatorMap.unmediate(mvcExpressSnippets);

		//mediatorMap.mediateWith(this.stage, KeyboardMediator);
	}

}
}