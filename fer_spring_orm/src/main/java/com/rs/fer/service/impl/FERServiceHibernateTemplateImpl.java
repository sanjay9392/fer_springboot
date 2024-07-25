package com.rs.fer.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;

public class FERServiceHibernateTemplateImpl implements FERService {

	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean registration(User user) {
		return (int) hibernateTemplate.save(user) > 0;
	}

	@Override
	public boolean login(String username, String password) {
		boolean isValidUser = false;
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
		detachedCriteria.add(Restrictions.eq("username", username));
		detachedCriteria.add(Restrictions.eq("password", password));

		List<User> users = (List<User>) hibernateTemplate.findByCriteria(detachedCriteria);

		if (!users.isEmpty()) {
			isValidUser = true;
		}

		return isValidUser;
	}

	@Override
	public boolean addExpense(Expense expense) {
		return (int) hibernateTemplate.save(expense) > 0;

	}

	@Override
	public boolean editExpense(Expense expense) {
		boolean isEditExpense = true;
		try {

			hibernateTemplate.update(expense);

		} catch (Exception e) {
			isEditExpense = false;
		}
		return isEditExpense;
	}

	@Override
	public boolean deleteExpense(int expenseId) {
		boolean isDeleteExpense = true;
		try {

			Expense expense = new Expense();
			expense.setId(expenseId);
			hibernateTemplate.delete(expense);

		} catch (Exception ex) {
			isDeleteExpense = false;
		}

		return isDeleteExpense;
	}

	@Override
	public boolean resetPassword(String newPassword, int id, String currentPassword) {
		User user = hibernateTemplate.get(User.class, id);
		if (user.getPassword().equals(currentPassword)) {
			user.setPassword(newPassword);
			hibernateTemplate.update(user);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Expense> getExpenseOptions(int userId) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Expense.class);
		detachedCriteria.add(Restrictions.eq("userId", userId));

		List<Expense> expenses = (List<Expense>) hibernateTemplate.findByCriteria(detachedCriteria);

		return expenses;
	}

	@Override
	public Expense getExpense(int expenseId) {
		return hibernateTemplate.get(Expense.class, expenseId);
	}

	@Override
	public List<Expense> getExpenseReport(int userId, String expenseType, String fromDate, String toDate) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Expense.class);
		detachedCriteria.add(Restrictions.eq("userId", userId));
		detachedCriteria.add(Restrictions.eq("type", expenseType));
		detachedCriteria.add(Restrictions.between("date", fromDate, toDate));
		List<Expense> expenses = (List<Expense>) hibernateTemplate.findByCriteria(detachedCriteria);
		return expenses;
	}

	@Override
	public User getUser(int userId) {
		User user = new User();
		user = hibernateTemplate.get(User.class, userId);
		if(user.getAddress()== null) {
			user.setAddress(new Address());
		}
		return user;
	}

	@Override
	public boolean updateUser(User user) {
		boolean isUpdateUser = true;
		try {

			hibernateTemplate.update(user);

		} catch (Exception ex) {
			isUpdateUser = false;
		}

		return isUpdateUser;
	}
}
