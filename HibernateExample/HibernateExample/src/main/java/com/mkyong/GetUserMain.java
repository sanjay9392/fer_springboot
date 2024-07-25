package com.mkyong;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

import com.mkyong.user.DBUser;

public class GetUserMain {
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
		user = (DBUser) session.get(DBUser.class, 200);
		System.out.println("get 1");
		if(user != null) {System.out.println(
				user.getUserId() + "," + user.getUsername() + "," + user.getCreatedBy() + "," + user.getCreatedDate());
		}
		user = (DBUser) session.get(DBUser.class, 200);
		System.out.println("get 2");
		if(user != null) {System.out.println(
				user.getUserId() + "," + user.getUsername() + "," + user.getCreatedBy() + "," + user.getCreatedDate());
		}
		// 5.close the session
		session.close();
	}
}
