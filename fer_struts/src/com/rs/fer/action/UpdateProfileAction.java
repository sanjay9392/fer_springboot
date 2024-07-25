package com.rs.fer.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.User;
import com.rs.fer.form.UpdateProfileForm;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class UpdateProfileAction extends DispatchAction {
	FERService ferService = new FERServiceImpl();

	public ActionForward name(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		UpdateProfileForm updateProfileForm = (UpdateProfileForm) form;
		HttpSession session = request.getSession();
		// 1.Get the input
		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		// 2.Call the service by passing the input
		User user = ferService.getUser(userId);
		session.setAttribute("user", user);
		
		// Form/VO/DTO <-------------- Bean/Entity/POJO
		updateProfileForm.setFirstName(user.getFirstName());
		updateProfileForm.setMiddleName(user.getMiddleName());
		updateProfileForm.setLastName(user.getLastName());

		updateProfileForm.setEmail(user.getEmail());
		updateProfileForm.setMobile(user.getMobile());

		Address address = user.getAddress();
		updateProfileForm.setLine1(address.getLine1());
		updateProfileForm.setLine2(address.getLine2());
		updateProfileForm.setCity(address.getCity());
		updateProfileForm.setState(address.getState());
		updateProfileForm.setPinCode(address.getPinCode());
		updateProfileForm.setCountry(address.getCountry());

		return mapping.findForward("nameInfo");
	}

	public ActionForward contact(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("contactInfo");
	}

	public ActionForward address(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("addressInfo");
	}

	public ActionForward review(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("review");
	}

	public ActionForward update(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UpdateProfileForm updateProfileForm = (UpdateProfileForm) form;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		// Form/VO/DTO --------------> Bean/Entity/POJO
		user.setFirstName(updateProfileForm.getFirstName());
		user.setMiddleName(updateProfileForm.getMiddleName());
		user.setLastName(updateProfileForm.getLastName());
		user.setEmail(updateProfileForm.getEmail());
		user.setMobile(updateProfileForm.getMobile());

		Address address = user.getAddress();
		address.setLine1(updateProfileForm.getLine1());
		address.setLine2(updateProfileForm.getLine2());
		address.setCity(updateProfileForm.getCity());
		address.setState(updateProfileForm.getState());
		address.setPinCode(updateProfileForm.getPinCode());
		address.setCountry(updateProfileForm.getCountry());
		
		//2.Call the service by passing the input
		boolean isUserUpdate = ferService.updateUser(user);

		// 3.Show the status

		if (isUserUpdate) {
			session.setAttribute("status", "User Profile Updated successfully");
		} else {
			session.setAttribute("status", "User Profile Update is failed");
		}

		return mapping.findForward("dashboard");
	}

}
