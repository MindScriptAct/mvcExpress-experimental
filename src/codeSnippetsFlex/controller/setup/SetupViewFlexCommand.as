package codeSnippetsFlex.controller.setup {
import codeSnippets.SpriteModuleTest;
import codeSnippets.view.MainAppMediator;
import codeSnippets.view.mediateWithTest.ChildSpriteTest;
import codeSnippets.view.mediateWithTest.ChildSpriteTestMediator;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Deril
 */
public class SetupViewFlexCommand extends Command {

	public function execute(blank:Object):void {
		////////////////////////////
		// View
		// - view classes are maped to mediator classes 1 to 1.
		////////////////////////////

		mediatorMap.map(SpriteModuleTest, MainAppMediator);
		mediatorMap.map(ChildSpriteTest, ChildSpriteTestMediator);

		// bad maping... (throws error.)
		//mediatorMap.map(Sprite, Sprite);

		// bad execute test...
		//var badCommand:SampleEmptyCommand = new SampleEmptyCommand();
		//badCommand.execute(null);
	}

}
}
