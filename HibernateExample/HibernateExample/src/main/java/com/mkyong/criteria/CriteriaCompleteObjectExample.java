package com.mkyong.criteria;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

import com.mkyong.user.DBUser;

public class CriteriaCompleteObjectExample {
	public static void main(String[] args) {
		System.out.println("Maven + Hibernate + MySql");

		// 1. Load the hibernate configuration
		Configuration configuration = new Configuration();
		configuration.configure("hibernate.cfg.xml");

		// 2. Build the session factory
		SessionFactory sessionFactory = configuration.buildSessionFactory();

		// 3. open the session
		Session session = sessionFactory.openSession();

		// 4.Actual call
		Criteria criteria = session.createCriteria(DBUser.class);
		System.out.println("criteria created");

		// Restriction api to filter the data
		// criteria.add(Restrictions.gt("grossSalary",15000f));

		// Order api to sort the data
		// criteria.addOrder(Order.asc("grossSalary"));

		// criteria to support pagination
		criteria.setFirstResult(0);
		criteria.setMaxResults(5);

		List<DBUser> users = criteria.list();
		System.out.println("users object created");

		Iterator<DBUser> iterator = users.iterator();
		System.out.println("iterator created");

		DBUser user = null;
		while (iterator.hasNext()) {
			user = iterator.next();
			System.out.println(user.getUserId() + "," + user.getCreatedBy());
		}

		// 5.close the session
		session.close();
	}
}
