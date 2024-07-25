package com.rs.struts.action.ex;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.rs.struts.form.ex.LoginForm;

public class LoginAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("LoginAction.execute()");
		// 1
		LoginForm loginForm = (LoginForm) form;
		String username = loginForm.getUsername();
		String password = loginForm.getPassword();

		// 2
		boolean isValidUser = false;
		if ("admin".equals(username.trim()) && "rs".equals(password.trim())) {
			isValidUser = true;
		}

		// 3
		String forwardName = (isValidUser) ? "success" : "failure";
		return mapping.findForward(forwardName);
	}

}
