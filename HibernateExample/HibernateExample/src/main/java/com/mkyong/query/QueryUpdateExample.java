package com.mkyong.query;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

public class QueryUpdateExample {
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
		Query query = session.createQuery(
				"update DBUser u set u.grossSalary=:gross, u.netSalary=:net, version=version+1 where u.userId =:id");
		System.out.println("query created");

		query.setParameter("gross", 20000f);
		query.setParameter("net", 25000f);
		query.setParameter("id", 32768);

		Transaction transaction = session.beginTransaction();

		int numberOfRecordsAffected = query.executeUpdate();
		System.out.println(numberOfRecordsAffected);

		transaction.commit();
		// 5.close the session
		session.close();
	}
}
