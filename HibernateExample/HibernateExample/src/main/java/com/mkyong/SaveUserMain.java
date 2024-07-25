package com.mkyong;

import java.util.Date;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

import com.mkyong.user.DBUser;

public class SaveUserMain {
	public static void main(String[] args) {
		System.out.println("Maven + Hibernate + MySql");

		DBUser user = new DBUser();

		//user.setUserId(1);
		user.setUsername("Sanjay");
		user.setCreatedBy("Hr1");
		user.setCreatedDate(new Date());

		// 1. Load the hibernate configuration
		Configuration configuration = new Configuration();
		configuration.configure("hibernate.cfg.xml");

		// 2. Build the session factory
		SessionFactory sessionFactory = configuration.buildSessionFactory();

		// 3. open the session
		Session session = sessionFactory.openSession();

		// 4. Begin the Transaction
		Transaction transaction = session.beginTransaction();

		// 5.Actual call
		session.save(user);
		//for saveOrUpdate method
		//session.saveOrUpdate(user);

		// 6. commit the transaction
		transaction.commit();

		// 7.close the session
		session.close();
	}
}
