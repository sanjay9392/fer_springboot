package com.rs.fer.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.util.HibernateUtil;

public class FERServiceImpl implements FERService {

	@Override
	public boolean registration(User user) {
		boolean isRegister = false;
		Session session = HibernateUtil.openSession();

		Transaction transaction = session.beginTransaction();

		isRegister = (int) session.save(user) > 0;

		transaction.commit();
		session.close();
		return isRegister;
	}

	@Override
	public boolean login(String username, String password) {

		boolean isValidUser = false;
		Session session = HibernateUtil.openSession();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("username", username));
		criteria.add(Restrictions.eq("password", password));

		List<User> users = criteria.list();
		session.close();

		if (!users.isEmpty()) {
			isValidUser = true;
		}
		return isValidUser;
	}

	@Override
	public boolean addExpense(Expense expense) {

		boolean isAddExpense = false;
		Session session = HibernateUtil.openSession();

		Transaction transaction = session.beginTransaction();

		isAddExpense = (int) session.save(expense) > 0;

		transaction.commit();
		session.close();
		return isAddExpense;
	}

	@Override
	public boolean editExpense(Expense expense) {
		boolean isEditExpense = true;
		Session session = HibernateUtil.openSession();
		try {
			Transaction transaction = session.beginTransaction();

			session.update(expense);

			transaction.commit();
		} catch (Exception ex) {
			isEditExpense = false;
		}
		session.close();
		return isEditExpense;
	}

	@Override
	public boolean deleteExpense(int expenseId) {
		boolean isDeleteExpense = true;
		Session session = HibernateUtil.openSession();
		try {
			Transaction transaction = session.beginTransaction();

			Expense expense = new Expense();
			expense.setId(expenseId);
			session.delete(expense);

			transaction.commit();
		} catch (Exception ex) {
			isDeleteExpense = false;
		}
		session.close();

		return isDeleteExpense;
	}

	@Override
	public boolean resetPassword(String newPassword, int id, String currentPassword) {

		boolean isResetPassword = false;
		Session session = HibernateUtil.openSession();

		Query query = session.createQuery("update User u set u.password=:new where u.id=:id and u.password =:current");
		query.setParameter("new", newPassword);
		query.setParameter("id", id);
		query.setParameter("current", currentPassword);

		Transaction transaction = session.beginTransaction();

		if (query.executeUpdate() > 0) {
			isResetPassword = true;
		}

		transaction.commit();
		session.close();
		return isResetPassword;
	}

	@Override
	public List<Expense> getExpenseOptions(int userId) {

		List<Expense> expenses = new ArrayList<>();

		Session session = HibernateUtil.openSession();
		Criteria criteria = session.createCriteria(Expense.class);
		criteria.add(Restrictions.eq("userId", userId));
		expenses = criteria.list();
		session.close();
		return expenses;
	}

	@Override
	public Expense getExpense(int expenseId) {

		Expense expense = null;

		Session session = HibernateUtil.openSession();
		expense = (Expense) session.get(Expense.class, expenseId);

		session.close();

		return expense;
	}

	@Override
	public List<Expense> getExpenseReport(int userId, String expenseType, String fromDate, String toDate) {
		List<Expense> expenses = new ArrayList<>();

		Session session = HibernateUtil.openSession();
		Criteria criteria = session.createCriteria(Expense.class);
		criteria.add(Restrictions.eq("userId", userId));
		criteria.add(Restrictions.eq("type", expenseType));
		criteria.add(Restrictions.between("date", fromDate, toDate));
		expenses = criteria.list();
		session.close();
		return expenses;
	}

	@Override
	public User getUser(int userId) {
		User user = null;
		Address address = new Address();
		Session session = HibernateUtil.openSession();
		user = (User) session.get(User.class, userId);
		
		if(user.getAddress()== null) {
			user.setAddress(address);
		}
		session.close();
		return user;
	}

	@Override
	public boolean updateUser(User user) {
		boolean isUpdateUser = true;
		Session session = HibernateUtil.openSession();
		try {
			Transaction transaction = session.beginTransaction();

			session.update(user);

			transaction.commit();
		} catch (Exception ex) {
			isUpdateUser = false;
		}
		session.close();

		return isUpdateUser;
	}
}
