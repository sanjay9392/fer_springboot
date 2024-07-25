package com.rs.fer.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.rs.fer.bean.Expense;
import com.rs.fer.form.AddExpenseForm;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class AddExpenseAction extends DispatchAction {
	FERService ferService = new FERServiceImpl();

	public ActionForward display(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("addExpense");
	}

	public ActionForward save(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 1.Get the input
		AddExpenseForm addExpenseForm = (AddExpenseForm) form;
		HttpSession session = request.getSession();
		Expense expense = new Expense();
		expense.setType(addExpenseForm.getType());
		expense.setDate(addExpenseForm.getDate());
		expense.setPrice(addExpenseForm.getPrice());
		expense.setNumberofitems(addExpenseForm.getNumberofitems());
		expense.setTotal(addExpenseForm.getTotal());
		expense.setBywhom(addExpenseForm.getBywhom());

		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		expense.setUserid(userId);

		// 2.Call the service by passing the input
		boolean isAddExpense = ferService.addExpense(expense);

		// 3.Show the status
		if (isAddExpense) {
			session.setAttribute("status", "Expense is added successfully.....! ");
		} else {
			session.setAttribute("status", "Add Expense is failed.....!");
		}
		return mapping.findForward("dashboard");
	}

}
