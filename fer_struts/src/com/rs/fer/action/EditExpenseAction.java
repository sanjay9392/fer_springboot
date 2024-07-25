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
import com.rs.fer.form.EditExpenseForm;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class EditExpenseAction extends DispatchAction {
	FERService ferService = new FERServiceImpl();

	public ActionForward options(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("editExpenseOptions");
	}

	public ActionForward display(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 1.Get the input
		EditExpenseForm editExpenseForm = (EditExpenseForm) form;
		int expenseId = editExpenseForm.getexpenseId();

		// 2
		Expense expense = ferService.getExpense(expenseId);

		// Form/VO/DTO <--------------Bean/Entity/POJO
		editExpenseForm.setType(expense.getType());
		editExpenseForm.setDate(expense.getDate());
		editExpenseForm.setPrice(expense.getPrice());
		editExpenseForm.setNumberofitems(expense.getNumberofitems());
		editExpenseForm.setTotal(expense.getTotal());
		editExpenseForm.setBywhom(expense.getBywhom());

		// 3
		return mapping.findForward("editExpense");
	}

	public ActionForward update(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 1.Get the input
		EditExpenseForm editExpenseForm = (EditExpenseForm) form;
		HttpSession session = request.getSession();

		Expense expense = new Expense();

		// Form/VO/DTO --------------> Bean/Entity/POJO
		expense.setType(editExpenseForm.getType());
		expense.setDate(editExpenseForm.getDate());
		expense.setPrice(editExpenseForm.getPrice());
		expense.setNumberofitems(editExpenseForm.getNumberofitems());
		expense.setTotal(editExpenseForm.getTotal());
		expense.setBywhom(editExpenseForm.getBywhom());

		expense.setId(editExpenseForm.getexpenseId());

		// 2.Call the service by passing the input
		boolean isEditExpense = ferService.editExpense(expense);

		// 3.Show the status
		if (isEditExpense) {
			session.setAttribute("status", "Expense is edited successfully.....! ");
		} else {
			session.setAttribute("status", "Edit Expense is failed.....!");
		}
		return mapping.findForward("dashboard");
	}

}
