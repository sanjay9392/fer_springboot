package com.mkyong;

import java.util.Date;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

import com.mkyong.user.DBUser;

public class HibernateObjectStateExamples {
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

		// a.Transient
		DBUser user = null;

		// b.Persistent
		user = (DBUser) session.get(DBUser.class, 6);
		user.setUsername("Naresh");
		Transaction transaction = session.beginTransaction();
		transaction.commit();

		// c.Detached

		// 5.close the session
		session.close();
	}
}
