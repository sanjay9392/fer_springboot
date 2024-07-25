package com.rs.fer.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class EditExpenseForm extends ActionForm {
	// Edit Expense Options
	private int expenseId;
	// Edit Expense
	private String type;
	private String date;
	private float price;
	private int numberofitems;
	private float total;
	private String bywhom;

	public int getexpenseId() {
		return expenseId;
	}

	public void setexpenseId(int expenseId) {
		this.expenseId = expenseId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getNumberofitems() {
		return numberofitems;
	}

	public void setNumberofitems(int numberofitems) {
		this.numberofitems = numberofitems;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public String getBywhom() {
		return bywhom;
	}

	public void setBywhom(String bywhom) {
		this.bywhom = bywhom;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// this.date = "Please enter valid date";
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		String method = request.getParameter("method");
		if (!"update".equals(method)) {
			return errors;
		}
		if (this.type == null || "".equals(this.type.trim())) {
			errors.add("type", new ActionMessage("expense.error.type"));
		}
		if (this.date == null || "".equals(this.date.trim())) {
			errors.add("date", new ActionMessage("expense.error.date"));
		}
		if (this.price <= 0) {
			errors.add("price", new ActionMessage("expense.error.price"));
		}
		if (this.numberofitems <= 0) {
			errors.add("numberofitems", new ActionMessage("expense.error.numberofitems"));
		}
		if (this.total <= 0) {
			errors.add("total", new ActionMessage("expense.error.total"));
		}
		if (this.bywhom == null || "".equals(this.bywhom.trim())) {
			errors.add("bywhom", new ActionMessage("expense.error.bywhom"));
		}
		return errors;
	}

}
