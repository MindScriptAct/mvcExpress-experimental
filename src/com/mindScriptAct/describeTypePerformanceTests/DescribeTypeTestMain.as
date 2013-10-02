package com.mindScriptAct.describeTypePerformanceTests {
import avmplus.DescribeTypeJSON;

import flash.display.Sprite;
import flash.text.TextField;
import flash.utils.Dictionary;
import flash.utils.describeType;
import flash.utils.getDefinitionByName;
import flash.utils.getTimer;
import flash.utils.setTimeout;

import mvcexpress.core.inject.InjectRuleVO;

public class DescribeTypeTestMain extends Sprite {


	/** Dictionary with constonts of inject names, used with constName, and constScope. */
	protected var classConstRegistry:Dictionary = new Dictionary();

	private var output:TextField;


	public function DescribeTypeTestMain() {

		output = new TextField();
		output.width = 500;
		output.height = 500;
		this.addChild(output);


		setTimeout(doTest, 2000);
	}

	private function doTest():void {
		var testTime:int = getTimer();

		for (var i:int = 0; i < 1000; i++) {
			var test:Object = getInjectRules(DescribeTestClass);
		}
		output.text = " test 1: " + (getTimer() - testTime);

		testTime = getTimer();

		for (i = 0; i < 1000; i++) {
			test = getJSONInjectRules(DescribeTestClass);
		}

		output.appendText("\n" + " test 2: " + (getTimer() - testTime));
	}


	/**
	 * Finds and cashes class injection point rules.
	 */
	protected function getInjectRules(signatureClass:Class):Vector.<InjectRuleVO> {
		var retVal:Vector.<InjectRuleVO> = new Vector.<InjectRuleVO>();
		var classDescription:XML = describeType(signatureClass);

		var factoryNodes:XMLList = classDescription.factory.*;
		var nodeCount:int = factoryNodes.length();
		for (var i:int; i < nodeCount; i++) {
			var node:XML = factoryNodes[i];
			var nodeName:String = node.name();
			if (nodeName == "variable" || nodeName == "accessor") {
				var metadataList:XMLList = node.metadata;
				var metadataCount:int = metadataList.length();
				for (var j:int = 0; j < metadataCount; j++) {
					nodeName = metadataList[j].@name;
					if (nodeName == "Inject") {
						retVal[retVal.length] = getInjectRule(metadataList[j].arg, node.@name.toString(), node.@type.toString())
					}
				}
			}
		}
		return retVal;
	}


	protected function getInjectRule(args:XMLList, varName:String, injectClass:String):InjectRuleVO {
		var injectName:String = "";
		var argCount:int = args.length();
		for (var k:int = 0; k < argCount; k++) {
			var argKey:String = args[k].@key;
			if (argKey == "name") {
				injectName = args[k].@value;
			} else if (argKey == "constName") {
				injectName = getInjectByContName(args[k].@value);
			}
		}
		var mapRule:InjectRuleVO = new InjectRuleVO();
		mapRule.varName = varName;
		mapRule.injectClassAndName = injectClass + injectName;
		return mapRule;
	}

	protected function getJSONInjectRules(signatureClass:Class):Vector.<InjectRuleVO> {
		var retVal:Vector.<InjectRuleVO> = new Vector.<InjectRuleVO>();

		var classDescription:Object = DescribeTypeJSON.getClassDescription(signatureClass);

		var traits:Object = classDescription["traits"];

		var variables:Array = traits["variables"];

		var accessors:Array = traits["accessors"];

		var count:int;

		if (variables) {
			count = variables.length;
			for (var i:int = 0; i < count; i++) {
				var varObj:Object = variables[i];
				var metadata:Array = varObj["metadata"];
				if (metadata) {
					for (var j:int = 0; j < metadata.length; j++) {
						if (metadata[j]["name"] == "Inject") {
							retVal[retVal.length] = getJSONInjectRule(metadata[j]["value"], varObj["name"], varObj["type"])
						}
					}
				}
			}
		}

		if (accessors) {
			count = accessors.length;
			for (i = 0; i < count; i++) {
				varObj = accessors[i];
				metadata = varObj["metadata"];
				if (metadata) {
					for (j = 0; j < metadata.length; j++) {
						if (metadata[j]["name"] == "Inject") {
							retVal[retVal.length] = getJSONInjectRule(metadata[j]["value"], varObj["name"], varObj["type"])
						}
					}
				}
			}
		}

		return retVal;
	}

	protected function getJSONInjectRule(args:Array, varName:String, injectClass:String):InjectRuleVO {
		var injectName:String = "";
		var argCount:int = args.length;
		for (var k:int = 0; k < argCount; k++) {
			var argKey:String = args[k].key;
			if (argKey == "name") {
				injectName = args[k].value;
			} else if (argKey == "constName") {
				injectName = getInjectByContName(args[k].value);
			}
		}
		var mapRule:InjectRuleVO = new InjectRuleVO();
		mapRule.varName = varName;
		mapRule.injectClassAndName = injectClass + injectName;
		return mapRule;
	}


	[Inline]

	protected function getInjectByContName(constName:String):String {
		if (!(constName in classConstRegistry)) {
			var split:Array = constName.split(".");
			var className:String = split[0];
			var splitLength:int = split.length - 1;
			for (var spliteIndex:int = 1; spliteIndex < splitLength; spliteIndex++) {
				className += "." + split[spliteIndex];
			}
			try {
				var constClass:Class = getDefinitionByName(className) as Class;
				classConstRegistry[constName] = constClass[split[spliteIndex]];
				if (!(constName in classConstRegistry)) {
					throw Error("Failed to get constant out of class:" + constClass + " Check constant name: " + split[spliteIndex]);
				}
			} catch (error:Error) {
				throw Error("Failed to get constant out of constName:" + constName + " Can't get class from definition : " + className);
			}
		}
		return classConstRegistry[constName];
	}

}
}
