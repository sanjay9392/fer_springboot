package com.mkyong.criteria;

import java.util.Iterator;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import com.mkyong.user.DBUser;

public class CriteriaMultiplePropertiesExample {
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

		ProjectionList projectionList = Projections.projectionList();

		Projection idProjection = Projections.property("userId");
		Projection usernameProjection = Projections.property("username");

		projectionList.add(idProjection);
		projectionList.add(usernameProjection);

		criteria.setProjection(projectionList);

		List<Object[]> users = criteria.list();
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
