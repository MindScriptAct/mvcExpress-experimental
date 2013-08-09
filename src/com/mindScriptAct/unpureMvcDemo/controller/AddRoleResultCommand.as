/*
 PureMVC AS3 Demo - Flex Employee Admin
 Copyright (c) 2007-10 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package com.mindScriptAct.unpureMvcDemo.controller {
import mvcexpress.extensions.unpuremvc.patterns.command.UnpureSimpleCommand;
import mvcexpress.extensions.unpuremvc.patterns.observer.UnpureNotification;

import mx.controls.Alert;

public class AddRoleResultCommand extends UnpureSimpleCommand {
	override public function execute(notification:UnpureNotification):void {
		var result:Boolean = Boolean(notification.getBody());
		if (result == false) {
			Alert.show("Role already exists for this user!", "Add User Role");
		}
	}

}
}