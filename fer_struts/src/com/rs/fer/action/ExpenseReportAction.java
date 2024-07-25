package com.rs.fer.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.rs.fer.bean.Expense;
import com.rs.fer.form.ExpenseReportForm;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class ExpenseReportAction extends DispatchAction {
	FERService ferService = new FERServiceImpl();

	public ActionForward selection(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("expenseReportSelection");
	}

	public ActionForward report(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		ExpenseReportForm expenseReportForm = (ExpenseReportForm) form;

		String type = request.getParameter("type");
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		List<Expense> expenses = ferService.getExpenseReport(userId, type, fromDate, toDate);

		// status

		if (expenses.isEmpty()) {
			session.setAttribute("status", "Expense not found");
		}
		return mapping.findForward("expenseReport");
	}

}
