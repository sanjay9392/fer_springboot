package com.rs.struts.form.ex;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

public class LoginForm extends ValidatorForm {
	private String username;
	private String password;

	public String getUsername() {
		System.out.println("LoginForm.getUsername()");
		return username;
	}

	public void setUsername(String username) {
		System.out.println("LoginForm.setUsername()");
		this.username = username;
	}

	public String getPassword() {
		System.out.println("LoginForm.getPassword()");
		return password;
	}

	public void setPassword(String password) {
		System.out.println("LoginForm.setPassword()");
		this.password = password;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		System.out.println("LoginForm.reset()");
		this.username = "Please enter Username";
	}

	/*@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		System.out.println("LoginForm.validate()");
		ActionErrors errors = new ActionErrors();

		if (this.username == null || "".equals(this.username.trim())) {
			errors.add("username", new ActionMessage("login.error.username"));
		}
		if (this.password == null || "".equals(this.password.trim())) {
			errors.add("password", new ActionMessage("login.error.password"));
		}
		System.out.println("................................................");
		return errors;
	}*/

}
