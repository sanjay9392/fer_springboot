package com.rs.fer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.rs.fer.bean.User;
import com.rs.fer.form.RegistrationForm;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class RegistrationAction extends Action {
	FERService ferService = new FERServiceImpl();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		RegistrationForm registrationForm = (RegistrationForm) form;
		User user = new User();
		user.setFirstName(registrationForm.getFirstName());
		user.setMiddleName(registrationForm.getMiddleName());
		user.setLastName(registrationForm.getLastName());
		user.setEmail(registrationForm.getEmail());
		user.setUsername(registrationForm.getUsername());
		user.setPassword(registrationForm.getPassword());
		user.setMobile(registrationForm.getMobile());

		// 2.Call the service by passing the input

		boolean isRegister = ferService.registration(user);

		// 3.Show the status
		HttpSession session = request.getSession();
		String forwardName = null;
		if (isRegister) {
			session.setAttribute("status", "User Registration is done successfully.....! ");
			forwardName = "login";

		} else {
			session.setAttribute("status", "User Registration is failed.....!");
			forwardName = "registration";
		}
		return mapping.findForward(forwardName);
	}

}
