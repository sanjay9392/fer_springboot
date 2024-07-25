package com.rs.fer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.rs.fer.form.ResetPasswordForm;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class ResetPasswordAction extends DispatchAction {
	FERService ferService = new FERServiceImpl();

	public ActionForward display(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("resetPassword");
	}

	public ActionForward reset(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 1.Get the input
		HttpSession session = request.getSession();
		ResetPasswordForm resetPasswordForm = (ResetPasswordForm) form;
		int id = Integer.parseInt(session.getAttribute("userId").toString());
		String currentPassword = resetPasswordForm.getCurrentPassword();
		String newPassword = resetPasswordForm.getNewPassword();

		// 2.Call the service by passing the input
		FERService ferService = new FERServiceImpl();
		boolean isResetPassword = ferService.resetPassword(id, currentPassword, newPassword);
		// 3.Show the status
		if (isResetPassword) {
			session.setAttribute("status", "Password changed successfully.....! ");
		} else {
			session.setAttribute("status", "Password change is failed.....!");
		}
		return mapping.findForward("dashboard");
	}

}
