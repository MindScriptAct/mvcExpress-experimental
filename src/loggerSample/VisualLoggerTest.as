package loggerSample {
import com.bit101.components.Label;
import com.bit101.components.PushButton;
import mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Shape;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Point;

import runTestModularSampleModules.ModuleNames;
import runTestModularSampleModules.console.Console;

import loggerSample.controller.TestCommandA;
import loggerSample.controller.TestCommandB;
import loggerSample.controller.TestCommandBlank;
import loggerSample.messages.Message;
import loggerSample.model.ITestProxyB;
import loggerSample.model.TestProxyA;
import loggerSample.model.TestProxyB;
import loggerSample.model.TestProxyC;
import loggerSample.msg.DataMsg;
import loggerSample.msg.Msg;
import loggerSample.msg.ViewMsg;
import loggerSample.view.VisualLoggerTestModuleMediator;
import loggerSample.view.deubleMediate.TestDoubleMediateView;
import loggerSample.view.deubleMediate.TestDoubleMediateViewMediator;
import loggerSample.view.deubleMediate.TestDoubleMediateViewMediator2;
import loggerSample.view.testA.TestViewA;
import loggerSample.view.testA.TestViewAMediator;
import loggerSample.view.testB.TestViewB;
import loggerSample.view.testB.TestViewBMediator;
import loggerSample.view.testB.TestViewBMediator;

import mvcexpress.MvcExpress;
import mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
[SWF(width="1600", height="700", frameRate="60")]
public class VisualLoggerTest extends Sprite {
    private var testViewA1Button:PushButton;
    private var testViewMapA1Button:PushButton;
    private var testViewA1:TestViewA;
    private var testViewA2Button:PushButton;
    private var testViewA2:TestViewA;
    private var testViewB1Button:PushButton;
    private var testViewB1:TestViewB;
    private var testViewB2Button:PushButton;
    private var testViewB2:TestViewB;
    private var testProxyCButton:PushButton;
    private var testProxyC:TestProxyC;
    private var testMessageB1Button:PushButton;
    private var testMessageB2Button:PushButton;
    private var testMessageB3Button:PushButton;

    public var module:TestModule = new TestModule(ModuleNames.SHELL);

    public function VisualLoggerTest() {
        CONFIG::debug {
            MvcExpress.debugFunction = trace;
            //MvcExpress.debugFunction = myDebugFunction;
            checkClassStringConstants(Msg, DataMsg, ViewMsg);
        }
        MvcExpressLogger.init(this.stage, 600, 0, 900, 400, 1, true/*, MvcExpressLogger.VISUALIZER_TAB*/);

		//MvcExpressLogger.ignoreClasses(TestCommandA);
		//MvcExpressLogger.ignoreClasses(TestViewBMediator);

//		MvcExpressLogger.moveTo(0, 0);
//		MvcExpressLogger.resize(900, 400);
//		MvcExpressLogger.setAlpha(0.8);
//		MvcExpressLogger.autoShow(true);
//		MvcExpressLogger.showTab(MvcExpressLogger.VISUALIZER_TAB);
//		MvcExpressLogger.setKey();

        //
        this.stage.scaleMode = StageScaleMode.NO_SCALE;
        this.stage.align = StageAlign.TOP_LEFT;


        var moduleLabel:Label;
        var roundRectangle:Shape;
        //trace("ModularSampleShellModule.onInit");

        // shell module area
        roundRectangle = new Shape();
        roundRectangle.graphics.lineStyle(2, 0x000000);
        roundRectangle.graphics.beginFill(0xE1E1FF);
        roundRectangle.graphics.drawRoundRect(5, 5, 570, 590, 20);
        roundRectangle.graphics.endFill();
        this.addChild(roundRectangle);

        moduleLabel = new Label(this, 10, 5, "MODULE:shell");
        moduleLabel.textField.textColor = 0x000000;


        // set up mediatorInjectTest.controller
        module.testCommandMap.map(Message.TEST_COMMAND_B, TestCommandB);
        module.testCommandMap.map(Message.TEST_MEDIATOR_A_COMMAND, TestCommandA);
        module.testCommandMap.map(Message.TEST_MEDIATOR_B_COMMAND, TestCommandB);
        module.testCommandMap.map(Message.TEST_PROXY_TO_COMMAND, TestCommandBlank);
        module.testCommandMap.map(Message.TEST_COMMAND_TO_COMMAND, TestCommandBlank);

        // set up data
        module.testProxyMap.map(new TestProxyA(), null, null, TestProxyA);
        module.testProxyMap.map(new TestProxyB(), "BProxyName", ITestProxyB, ITestProxyB);

        // set-up view
        module.testMediatorMap.map(VisualLoggerTest, VisualLoggerTestModuleMediator);
        //module.testMediatorMap.map(TestViewA, TestViewAMediator);
        module.testMediatorMap.map(TestViewB, TestViewBMediator);

        // start
        module.testMediatorMap.mediate(this);


        //
        testViewMapA1Button = new PushButton(this, 10, 470, "Map TestViewA 1", handleMapMediatorA1);

        testViewA1Button = new PushButton(this, 10, 500, "Add TestViewA 1", handleAddMediatorA1);
        testViewA1Button.enabled = false;


        testViewA2Button = new PushButton(this, 150, 500, "Add TestViewA 2", handleAddMediatorA2);
        testViewA2Button.enabled = false;

        testViewB1Button = new PushButton(this, 10, 530, "Add TestViewB 1", handleAddMediatorB1);
        testViewB2Button = new PushButton(this, 150, 530, "Add TestViewB 2", handleAddMediatorB2);

        testMessageB1Button = new PushButton(this, 300, 500, "Module:Execute CommandA", handleCommandA);
        testMessageB1Button.width = 170;
        testMessageB2Button = new PushButton(this, 300, 530, "Module: message to command", handleCommandB);
        testMessageB3Button = new PushButton(this, 300, 555, "Module: message to mediator", handleCommandC);
        testMessageB2Button.width = 170;
        testMessageB3Button.width = 170;

        testProxyCButton = new PushButton(this, 180, 570, "Add TestProxyC", handleAddProxyC);

        // console module area
        roundRectangle = new Shape();
        roundRectangle.graphics.lineStyle(2, 0x000000);
        roundRectangle.graphics.beginFill(0xE1E1FF);
        roundRectangle.graphics.drawRoundRect(600, 430, 380, 170, 20);
        roundRectangle.graphics.endFill();
        this.addChild(roundRectangle);

        moduleLabel = new Label(this, 600 + 10, 430 + 5, "MODULE:Console0");
        moduleLabel.textField.textColor = 0x000000;

        var console:Console = new Console();
        this.addChild(console);
        console.x = 600;
        console.y = 450;


        //
        module.testMediatorMap.map(TestDoubleMediateView, TestDoubleMediateViewMediator, null, TestDoubleMediateViewMediator2);
        module.testMediatorMap.mediate(new TestDoubleMediateView());


        module.testListing();

    }


    private function handleAddProxyC(event:Event):void {
        module
        if (testProxyC) {
            module.testProxyMap.unmap(TestProxyC);
            testProxyC = null;
            testProxyCButton.label = "Add TestProxyC";
        } else {
            testProxyC = new TestProxyC();
            module.testProxyMap.map(testProxyC);
            testProxyCButton.label = "Remove TestProxyC";
        }
    }

    private function handleAddMediatorA1(event:Event):void {
        if (testViewA1) {
            module.testMediatorMap.unmediate(testViewA1);
            this.removeChild(testViewA1);
            testViewA1 = null;
            testViewA1Button.label = "Add TestViewA 1";
        } else {
            testViewA1 = new TestViewA();
            this.addChild(testViewA1);
            module.testMediatorMap.mediate(testViewA1);
            testViewA1Button.label = "Remove TestViewA 1";
            testViewA1.x = 20;
            testViewA1.y = 20;
        }
    }

    private function handleMapMediatorA1(event:Event):void {
        if (module.testMediatorMap.isMapped(TestViewA, TestViewAMediator)) {
            module.testMediatorMap.unmap(TestViewA, TestViewAMediator);
            testViewMapA1Button.label = "Map TestViewA 1";
            testViewA1Button.enabled = false;
            testViewA2Button.enabled = false;
        } else {
            module.testMediatorMap.map(TestViewA, TestViewAMediator);
            testViewMapA1Button.label = "Unmap TestViewA 1";
            testViewA1Button.enabled = true;
            testViewA2Button.enabled = true;
        }
    }


    private function handleAddMediatorA2(event:Event):void {
        if (testViewA2) {
            module.testMediatorMap.unmediate(testViewA2);
            this.removeChild(testViewA2);
            testViewA2 = null;
            testViewA2Button.label = "Add TestViewA 2";
        } else {
            testViewA2 = new TestViewA();
            this.addChild(testViewA2);
            module.testMediatorMap.mediate(testViewA2);
            testViewA2Button.label = "Remove TestViewA 2";
            testViewA2.x = 300;
            testViewA2.y = 20;
        }
    }

    private function handleAddMediatorB1(event:Event):void {
        if (testViewB1) {
            module.testMediatorMap.unmediate(testViewB1);
            this.removeChild(testViewB1);
            testViewB1 = null;
            testViewB1Button.label = "Add TestViewB 1";

        } else {
            testViewB1 = new TestViewB();
            this.addChild(testViewB1);
            module.testMediatorMap.mediate(testViewB1);
            testViewB1Button.label = "Remove TestViewB 1";
            testViewB1.x = 20;
            testViewB1.y = 200;
        }
    }

    private function handleAddMediatorB2(event:Event):void {
        if (testViewB2) {
            module.testMediatorMap.unmediate(testViewB2);
            this.removeChild(testViewB2);
            testViewB2 = null;
            testViewB2Button.label = "Add TestViewB 2";
        } else {
            testViewB2 = new TestViewB();
            this.addChild(testViewB2);
            module.testMediatorMap.mediate(testViewB2);
            testViewB2Button.label = "Remove TestViewB 2";
            testViewB2.x = 300;
            testViewB2.y = 200;
        }
    }

    private function handleCommandA(event:Event):void {
        module.testCommandMap.execute(TestCommandA, "test param A")
    }

    private function handleCommandB(event:Event):void {
        module.sendMessage(Message.TEST_COMMAND_B, new Point(10, 20));
    }

    private function handleCommandC(event:Event):void {
        module.sendMessage(Message.TEST_MODULE_TO_MEDIATORS_A);
    }

}
}