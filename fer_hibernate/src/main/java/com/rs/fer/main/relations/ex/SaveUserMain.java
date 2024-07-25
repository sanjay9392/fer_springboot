package com.rs.fer.main.relations.ex;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class SaveUserMain {

	public static void main(String[] args) {

		System.out.println("Maven + Hibernate + MySql");
		// 1. Load the hibernate configuration
		Configuration configuration = new Configuration();
		configuration.configure("hibernate.cfg.xml");

		// 2. Build the session factory
		SessionFactory sessionFactory = configuration.buildSessionFactory();

		// 3. open the session
		Session session = sessionFactory.openSession();

		// 4. Begin the Transaction
		Transaction transaction = session.beginTransaction();

		// To create object and load the property data
		User user = new User();
		user.setEmail("sanjay@mail.com");

		Set<Expense> expenses = new HashSet<Expense>();
		Expense expense1 = new Expense();
		expense1.setTotal(100);
		expenses.add(expense1);

		Expense expense2 = new Expense();
		expense2.setTotal(200);
		expenses.add(expense2);

		Expense expense3 = new Expense();
		expense3.setTotal(300);
		expenses.add(expense3);

		Expense expense4 = new Expense();
		expense4.setTotal(400);
		expenses.add(expense4);

		user.setExpenses(expenses);

		Address address = new Address();
		address.setCity("Vijayawada");

		user.setAddress(address);

		// 5.Actual call
		session.save(user);

		// 6. commit the transaction
		transaction.commit();

		// 7.close the session
		session.close();

	}

}
