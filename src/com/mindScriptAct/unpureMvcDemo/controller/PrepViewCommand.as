/*
 PureMVC AS3 Demo - Flex Employee Admin
 Copyright (c) 2007-10 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package com.mindScriptAct.unpureMvcDemo.controller {
import com.mindScriptAct.unpureMvcDemo.EmployeeAdmin;
import com.mindScriptAct.unpureMvcDemo.view.RolePanelMediator;
import com.mindScriptAct.unpureMvcDemo.view.UserFormMediator;
import com.mindScriptAct.unpureMvcDemo.view.UserListMediator;

import mvcexpress.extensions.unpuremvc.patterns.command.UnpureSimpleCommand;
import mvcexpress.extensions.unpuremvc.patterns.observer.UnpureNotification;

public class PrepViewCommand extends UnpureSimpleCommand {
	/**
	 * Prepare the View.
	 *
	 * Get the View Components for the Mediators from the app,
	 * a reference to which was passed on the original startup
	 * notification.
	 */
	override public function execute(note:UnpureNotification):void {
		var app:EmployeeAdmin = EmployeeAdmin(note.getBody());
		facade.registerMediator(new UserFormMediator(app.userForm));
		facade.registerMediator(new UserListMediator(app.userList));
		facade.registerMediator(new RolePanelMediator(app.rolePanel));
	}
}
}