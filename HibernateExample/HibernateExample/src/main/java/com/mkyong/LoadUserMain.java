package com.mkyong;

import org.hibernate.ObjectNotFoundException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

import com.mkyong.user.DBUser;

public class LoadUserMain {
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
		DBUser user = null;
		try {
			user = (DBUser) session.load(DBUser.class, 400);
			System.out.println("load 1");
			System.out.println(user.getUserId() + "," + user.getUsername() + "," + user.getCreatedBy() + ","
					+ user.getCreatedDate());
		} catch (ObjectNotFoundException onfe) {
		}
		try {
			user = (DBUser) session.load(DBUser.class, 400);
			System.out.println("load 2");
			System.out.println(user.getUserId() + "," + user.getUsername() + "," + user.getCreatedBy() + ","
					+ user.getCreatedDate());
		} catch (ObjectNotFoundException onfe) {
		}

		// 5.close the session
		session.close();
	}

}