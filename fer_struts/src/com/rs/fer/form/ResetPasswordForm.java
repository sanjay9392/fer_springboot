package com.rs.fer.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class ResetPasswordForm extends ActionForm {
	private String currentPassword;
	private String newPassword;
	private String confirmNewPassword;

	public String getCurrentPassword() {
		return currentPassword;
	}

	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}

	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.currentPassword = "Please enter Current Password";
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		String method = request.getParameter("method");
		if ("display".equals(method)) {
			return errors;
		}
		if (this.currentPassword == null || "".equals(this.currentPassword.trim())) {
			errors.add("currentPassword", new ActionMessage("resetpassword.error.currentpassword"));
		}
		if (this.newPassword == null || "".equals(this.newPassword.trim())) {
			errors.add("newPassword", new ActionMessage("resetpassword.error.newpassword"));
		}
		return errors;
	}

}
