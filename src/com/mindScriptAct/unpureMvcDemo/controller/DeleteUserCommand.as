/*
 PureMVC AS3 Demo - Flex Employee Admin
 Copyright (c) 2007-10 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package com.mindScriptAct.unpureMvcDemo.controller {
import com.mindScriptAct.unpureMvcDemo.ApplicationFacade;
import com.mindScriptAct.unpureMvcDemo.model.RoleProxy;
import com.mindScriptAct.unpureMvcDemo.model.UserProxy;
import com.mindScriptAct.unpureMvcDemo.model.vo.UserVO;

import mvcexpress.extensions.unpuremvc.patterns.command.UnpureSimpleCommand;
import mvcexpress.extensions.unpuremvc.patterns.observer.UnpureNotification;

public class DeleteUserCommand extends UnpureSimpleCommand {

	// retrieve the user and role proxies and delete the user
	// and his roles. then send the USER_DELETED notification
	override public function execute(notification:UnpureNotification):void {
		var user:UserVO = UserVO(notification.getBody());
		var userProxy:UserProxy = UserProxy(facade.retrieveProxy(UserProxy.NAME));
		var roleProxy:RoleProxy = RoleProxy(facade.retrieveProxy(RoleProxy.NAME));
		userProxy.deleteItem(user);
		roleProxy.deleteItem(user);
		sendNotification(ApplicationFacade.USER_DELETED);

	}

}
}