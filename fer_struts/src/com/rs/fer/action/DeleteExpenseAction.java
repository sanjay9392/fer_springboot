package com.rs.fer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class DeleteExpenseAction extends DispatchAction {
	FERService ferService = new FERServiceImpl();

	public ActionForward options(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("deleteExpenseOptions");
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// Body

		int expenseid = Integer.parseInt(request.getParameter("expenseId"));

		// 2.Call the service by passing the input
		HttpSession session = request.getSession();
		boolean isDeleteExpense = ferService.deleteExpense(expenseid);
		// 3.Show the status
		if (isDeleteExpense) {
			session.setAttribute("status", "Expense deleted successfully.....! ");
		} else {
			session.setAttribute("status", "Expense deletion  failed.....!");
		}
		return mapping.findForward("dashboard");
	}

}
