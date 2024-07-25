package com.mkyong.query;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;
import com.mkyong.user.DBUser;

public class QueryMultiplePropertiesExample {
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
		Query query = session.createQuery("select user.userId, user.username from DBUser user");
		System.out.println("query created");

		List<Object[]> users = query.list();
		System.out.println("users object created");

		Iterator<Object[]> iterator = users.iterator();
		System.out.println("iterator created");

		Object[] userArr = null;
		while (iterator.hasNext()) {
			userArr = iterator.next();
			System.out.println(userArr[0] + "," + userArr[1]);
		}

		// 5.close the session
		session.close();
	}
}
