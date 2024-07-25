package com.rs.fer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.rs.fer.form.LoginForm;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class LoginAction extends Action {
	FERService ferService = new FERServiceImpl();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 1.Get the input
		LoginForm loginForm = (LoginForm) form;
		String username = loginForm.getUsername();
		String password = loginForm.getPassword();

		// 2.Get the Service by passing the input
		int userId = ferService.login(username, password);

		// 3.Show the status
		String forwardName = null;
		HttpSession session = request.getSession();
		if (userId > 0) {
			session.setAttribute("username", username);
			session.setAttribute("userId", userId);

			// Body
			session.setAttribute("status", "Welcome to the user:" + username + "!");

			forwardName = "dashboard";
		} else {
			session.setAttribute("status", "Incorrect Username/Password...Please try again.....!");
			forwardName = "login";
		}
		
		return mapping.findForward(forwardName);
	}

}

