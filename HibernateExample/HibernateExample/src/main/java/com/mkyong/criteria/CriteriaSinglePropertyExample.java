package com.mkyong.criteria;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;

import com.mkyong.user.DBUser;

public class CriteriaSinglePropertyExample {
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

		// 1.create the projection object
		Projection projection = Projections.property("userId");

		// 2.set the projection to the criteria object
		criteria.setProjection(projection);

		List<Integer> users = criteria.list();
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
