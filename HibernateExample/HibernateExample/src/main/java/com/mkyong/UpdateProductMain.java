package com.mkyong;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.mkyong.user.DBProduct;

public class UpdateProductMain {
	public static void main(String[] args) {

		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");

		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		Object o = session.load(DBProduct.class, new Integer(2));
		DBProduct s = (DBProduct) o;

		Transaction tx = session.beginTransaction();

//s.setStno(105);   should not update, because we loaded with that number right..?
		s.setPrice(4000); // implicitly update method will be called..

		tx.commit();

		System.out.println("Object Updated successfully.....!!");
		session.close();
		factory.close();
	}

}
