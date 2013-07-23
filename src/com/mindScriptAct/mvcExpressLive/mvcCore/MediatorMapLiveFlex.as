// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package com.mindScriptAct.mvcExpressLive.mvcCore {
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

import mvcexpress.core.*;
import mvcexpress.core.messenger.Messenger;
import mvcexpress.core.namespace.pureLegsCore;
import mvcexpress.dlc.live.core.MediatorMapLive;
import mvcexpress.mvc.Mediator;

/**
 * Handles flex application mediators.                                                                                                                    </br>
 *  FlexMediatorMap acts a bit differently from MediatorMap. Flex Mediators are not registered until "creationComplete" event is sent.                    </br>
 *  This is needed because Flex view objects acts differently then simple AS3 display objects - Flex object can be created in next frames.                </br>
 *  It is common for flex objects to be completed not in the order they were created. Keep this in mind then mediating flex objects.
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */

use namespace pureLegsCore;

public class MediatorMapLiveFlex extends MediatorMapLive {

	private var uiComponentClass:Class;

	/* CONSTRUCTOR */
	public function MediatorMapLiveFlex($moduleName:String, $messenger:Messenger, $proxyMap:ProxyMap) {
		uiComponentClass = getFlexClass();
		super($moduleName, $messenger, $proxyMap);

		CONFIG::debug {
			if (!uiComponentClass) {
				throw  Error("FlexMediatorMap failed to get 'mx.core::UIComponent' class. Are you sure you have flex project?");
			}
		}
	}

	/**
	 * Automatically instantiates mediator class(if mapped), handles all injections(including viewObject), and calls onRegister function.
	 * Throws error if mediator class is not mapped to viewObject class.
	 * If object is not initialized - mvcExpress will wait for 'creationComplete' to be dispatched before mediating it.
	 * @param    viewObject    view object to mediate.
	 */
	override public function mediate(viewObject:Object):void {
		if ((viewObject is uiComponentClass) && !viewObject['initialized']) {

			var viewClass:Class = viewObject.constructor as Class;
			// if '.constructor' fail to get class - do it using class name. (.constructor is faster but might fail with some object.)
			if (!viewClass) {
				viewClass = getDefinitionByName(getQualifiedClassName(viewObject)) as Class;
			}

			// get mapped mediator class.
			var mediatorClass:Class = mediatorClassRegistry[viewClass];
			if (mediatorClass) {
				IEventDispatcher(viewObject).addEventListener('creationComplete', handleOnCreationComplete, false, 0, true);
			} else {
				throw Error("View object" + viewObject + " class is not mapped with any mediator class. use mediatorMap.map()");
			}

		} else {
			super.mediate(viewObject);
		}
	}

	/** Start flex view object mediation after creationComplete is dispatched. */
	private function handleOnCreationComplete(event:Event):void {
		IEventDispatcher(event.target).removeEventListener('creationComplete', handleOnCreationComplete);
		//
		super.mediate(event.target);
	}

	/**
	 * If any mediator is mediating viewObject: it calls onRemove, automatically removes all handler functions listening for messages from that mediator and deletes it.
	 * If flex object is unmediated before 'creationComplete' is dispatched - nothing is done. (because mediation is not done in the first place.)
	 * @param    viewObject    view object witch mediator will be destroyed.
	 */
	override public function unmediate(viewObject:Object):void {
		var mediator:Mediator = mediatorRegistry[viewObject];
		if (mediator) {
			super.unmediate(viewObject);
		} else {
			// remove creationComplete handlers if any.
			if (IEventDispatcher(viewObject).hasEventListener('creationComplete')) {
				IEventDispatcher(viewObject).removeEventListener('creationComplete', handleOnCreationComplete);
			}
		}
	}

	//----------------------------------
	//     utils
	//----------------------------------

	/** get flex lowest class by definition. ( way to check for flex project.) */
	private static function getFlexClass():Class {
		var uiComponentClass:Class;
		try {
			uiComponentClass = getDefinitionByName('mx.core::UIComponent') as Class;
		} catch (error:Error) {
			// do nothing
		}
		return uiComponentClass;
	}

}
}