package codeSnippetsFlex.view {
import codeSnippets.SpriteModuleTest;
import codeSnippets.messages.Msg;
import codeSnippets.model.SampleEmptyProxy;
import codeSnippets.view.mediateWithTest.ChildSpriteTest;

import mvcexpress.mvc.Mediator;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class MainFlexAppMediator extends Mediator {

	////////////////////////////
	// geting view object...
	////////////////////////////
	[Inject]
	public var view:SpriteModuleTest;

	////////////////////////////
	// geting proxies...
	////////////////////////////
	[Inject]
	public var sampleEmptyProxy:SampleEmptyProxy;

	override protected function onRegister():void {
		trace("SampleAppMediator.onRegister");

		////////////////////////////
		// comunication
		////////////////////////////
		addHandler(Msg.TEST_DATA_MESSAGE, handleTestDataMessage);

		sendMessage(Msg.TEST_DATA_MESSAGE, "SampleAppMediator works!!!");

		removeHandler(Msg.TEST_DATA_MESSAGE, handleTestDataMessage);

		var childTest:ChildSpriteTest = new ChildSpriteTest();
		view.addChild(childTest);
		mediatorMap.mediate(childTest);
	}

	// callBack MUST have 1 and only one parameter. This parameter can be typed(or be Object type)
	private function handleTestDataMessage(messageText:String):void {
		trace("SampleAppMediator.handleTestDataMessage > messageText : " + messageText);
	}

	override protected function onRemove():void {
		trace("SampleAppMediator.onRemove");
	}

}
}