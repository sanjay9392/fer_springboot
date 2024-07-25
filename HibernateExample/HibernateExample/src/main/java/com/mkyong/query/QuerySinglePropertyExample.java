package com.mkyong.query;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

public class QuerySinglePropertyExample {
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
		Query query = session.createQuery("select user.userId from DBUser user");
		System.out.println("query created");

		List<Integer> users = query.list();
		System.out.println("users object created");

		Iterator<Integer> iterator = users.iterator();
		System.out.println("iterator created");

		Integer user = null;
		while (iterator.hasNext()) {
			user = iterator.next();
			System.out.println(user);
		}

		// 5.close the session
		session.close();
	}
}
