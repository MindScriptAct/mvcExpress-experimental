package rutTestCodeSnippetsFlex.view.mediateWithTest {
import flash.display.Sprite;

import mvcexpress.mvc.Mediator;

/**
 * CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class ChildSpriteTestFlexMediator extends Mediator {

	[Inject]
	public var view:ChildSpriteFlexTest;

	//[Inject]
	//public var myProxy:MyProxy;

	override protected function onRegister():void {
		var circle:Sprite = new Sprite();
		view.addChild(circle);
		mediatorMap.mediateWith(circle, CircleTestFlexMediator);

		var square:Sprite = new Sprite();
		view.addChild(square);
		mediatorMap.mediateWith(square, SquareTestFlexMediator);
		mediatorMap.unmediate(square);
		mediatorMap.mediateWith(square, SquareTestFlexMediator);

	}

	override protected function onRemove():void {

	}

}
}