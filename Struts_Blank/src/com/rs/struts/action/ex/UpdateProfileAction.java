package com.rs.struts.action.ex;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class UpdateProfileAction extends DispatchAction{
	
	public ActionForward nameInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("UpdateProfileAction.nameInfo()");
		return mapping.findForward("name");
	}

	public ActionForward contactInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			System.out.println("UpdateProfileAction.contactInfo()");
			return mapping.findForward("contact");
	}

	public ActionForward addressInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws Exception {
				System.out.println("UpdateProfileAction.addressInfo()");
				return mapping.findForward("address");
	}

	public ActionForward review(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("UpdateProfileAction.review()");
		return mapping.findForward("review");
	}

}
