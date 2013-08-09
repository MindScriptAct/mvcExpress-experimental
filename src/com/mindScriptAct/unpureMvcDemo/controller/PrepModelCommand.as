/*
 PureMVC AS3 Demo - Flex Employee Admin
 Copyright (c) 2007-10 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package com.mindScriptAct.unpureMvcDemo.controller {
import com.mindScriptAct.unpureMvcDemo.model.RoleProxy;
import com.mindScriptAct.unpureMvcDemo.model.UserProxy;
import com.mindScriptAct.unpureMvcDemo.model.enum.DeptEnum;
import com.mindScriptAct.unpureMvcDemo.model.enum.RoleEnum;
import com.mindScriptAct.unpureMvcDemo.model.vo.RoleVO;
import com.mindScriptAct.unpureMvcDemo.model.vo.UserVO;

import mvcexpress.extensions.unpuremvc.patterns.command.UnpureSimpleCommand;
import mvcexpress.extensions.unpuremvc.patterns.observer.UnpureNotification;

public class PrepModelCommand extends UnpureSimpleCommand {
	/**
	 * Prepare the Model.
	 */
	override public function execute(note:UnpureNotification):void {
		// Create User Proxy,
		var userProxy:UserProxy = new UserProxy();

		//Populate it with dummy data
		userProxy.addItem(new UserVO("lstooge", "Larry", "Stooge", "larry@stooges.com", "ijk456", DeptEnum.ACCT));
		userProxy.addItem(new UserVO("cstooge", "Curly", "Stooge", "curly@stooges.com", "xyz987", DeptEnum.SALES));
		userProxy.addItem(new UserVO("mstooge", "Moe", "Stooge", "moe@stooges.com", "abc123", DeptEnum.PLANT));

		// register it
		facade.registerProxy(userProxy);

		// Create Role Proxy
		var roleProxy:RoleProxy = new RoleProxy();

		//Populate it with dummy data
		roleProxy.addItem(new RoleVO("lstooge", [ RoleEnum.PAYROLL,
			RoleEnum.EMP_BENEFITS ]));
		roleProxy.addItem(new RoleVO("cstooge", [ RoleEnum.ACCT_PAY,
			RoleEnum.ACCT_RCV,
			RoleEnum.GEN_LEDGER ]));
		roleProxy.addItem(new RoleVO("mstooge", [ RoleEnum.INVENTORY,
			RoleEnum.PRODUCTION,
			RoleEnum.SALES,
			RoleEnum.SHIPPING ]));
		// register it
		facade.registerProxy(roleProxy);
	}
}
}