/*
 PureMVC AS3 Demo - Flex Employee Admin
 Copyright (c) 2007-10 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package unpureMvcDemo.view {
import unpureMvcDemo.ApplicationFacade;
import unpureMvcDemo.model.RoleProxy;
import unpureMvcDemo.model.vo.RoleVO;
import unpureMvcDemo.model.vo.UserVO;
import unpureMvcDemo.view.components.RolePanel;

import flash.events.Event;

import mvcexpress.extensions.unpuremvc.patterns.mediator.UnpureMediator;
import mvcexpress.extensions.unpuremvc.patterns.observer.UnpureNotification;

public class RolePanelMediator extends UnpureMediator {
	private var roleProxy:RoleProxy;

	public static const NAME:String = "RolePanelMediator";

	public function RolePanelMediator(viewComponent:RolePanel) {
		super(NAME, viewComponent);
	}

	override protected function onRegister():void {
		rolePanel.addEventListener(RolePanel.ADD, onAddRole);
		rolePanel.addEventListener(RolePanel.REMOVE, onRemoveRole);

		roleProxy = RoleProxy(facade.retrieveProxy(RoleProxy.NAME));
	}

	override public function listNotificationInterests():Array {
		return [
			ApplicationFacade.NEW_USER,
			ApplicationFacade.USER_ADDED,
			ApplicationFacade.USER_UPDATED,
			ApplicationFacade.USER_DELETED,
			ApplicationFacade.CANCEL_SELECTED,
			ApplicationFacade.USER_SELECTED,
			ApplicationFacade.ADD_ROLE_RESULT
		];
	}

	override public function handleNotification(note:UnpureNotification):void {

		switch (note.getName()) {
			case ApplicationFacade.NEW_USER:
				clearForm();
				break;

			case ApplicationFacade.USER_ADDED:
				rolePanel.user = UserVO(note.getBody());
				var roleVO:RoleVO = new RoleVO(rolePanel.user.username);
				roleProxy.addItem(roleVO);
				clearForm();
				break;

			case ApplicationFacade.USER_UPDATED:
				clearForm();
				break;

			case ApplicationFacade.USER_DELETED:
				clearForm();
				break;

			case ApplicationFacade.CANCEL_SELECTED:
				clearForm();
				break;

			case ApplicationFacade.USER_SELECTED:
				rolePanel.user = UserVO(note.getBody());
				rolePanel.userRoles = roleProxy.getUserRoles(rolePanel.user.username);
				rolePanel.reset();
				break;

			case ApplicationFacade.ADD_ROLE_RESULT:
				rolePanel.userRoles = roleProxy.getUserRoles(rolePanel.user.username);
				rolePanel.reset();
				break;

		}
	}

	private function onAddRole(event:Event):void {
		roleProxy.addRoleToUser(rolePanel.user, rolePanel.selectedRole);
	}

	private function onRemoveRole(event:Event):void {
		roleProxy.removeRoleFromUser(rolePanel.user, rolePanel.selectedRole);
	}

	private function clearForm():void {
		rolePanel.user = null;
		rolePanel.userRoles = null;
		rolePanel.reset();
	}

	private function get rolePanel():RolePanel {
		return viewComponent as RolePanel;
	}

}
}