package com.rs.fer.form;

import org.apache.struts.action.ActionForm;

public class DeleteExpenseForm extends ActionForm{
	private int expenseId;
	
	public void setExpenseId(int expenseId) {
		this.expenseId = expenseId;
	}
	public int getExpenseId() {
		return expenseId;
	}
}
