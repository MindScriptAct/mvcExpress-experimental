package com.mindScriptAct.modules.console {
import com.bit101.components.PushButton;
import com.bit101.components.TextArea;
import com.mindScriptAct.modules.ModuleNames;
import com.mindScriptAct.modules.console.controller.InitConsoleModuleCommand;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldType;

import mvcexpress.modules.ModuleCore;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class Console extends Sprite {

	private var module:ModuleCore;

	public var consoleId:int;

	public var outputTf:TextArea;
	public var inputTf:TextField;
	public var inputBtn:Sprite;

	public function Console(consoleId:int = 0) {
		this.consoleId = consoleId;

		module = new ModuleCore(ModuleNames.CONSOLE + this.consoleId);

		renderConsoleView();

		module.executeCommand(InitConsoleModuleCommand, this);


	}

	public function renderConsoleView():void {
		// add message output
		outputTf = new TextArea();
		this.addChild(outputTf);
		outputTf.text = "Console #" + consoleId + " started.\n";

		outputTf.width = 300;
		outputTf.height = 100;
		outputTf.x = 5;
		outputTf.y = 5;

		// add message input
		inputTf = new TextField();
		this.addChild(inputTf);
		inputTf.text = '';
		inputTf.border = true;
		inputTf.type = TextFieldType.INPUT;

		inputTf.width = 300;
		inputTf.height = 22;
		inputTf.x = 5;
		inputTf.y = outputTf.x + outputTf.height + 5;

		inputBtn = new PushButton(this, inputTf.x + inputTf.width + 5, inputTf.y + 2, "send");
		inputBtn.width = 50;

	}

	public function disposeModule():void {
		module.disposeModule();
	}
}
}