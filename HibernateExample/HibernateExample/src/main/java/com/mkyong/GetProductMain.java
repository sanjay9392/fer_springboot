package com.mkyong;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.mkyong.user.DBProduct;

public class GetProductMain {
	public static void main(String[] args)
	{

		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml"); 

		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		Object o=session.load(DBProduct.class,new Integer(101));
		DBProduct s=(DBProduct)o;
		// For loading Transaction scope is not necessary...
		System.out.println("Loaded object product name is___"+s.getProName());

		System.out.println("Object Loaded successfully.....!!");
		session.close();
		factory.close();
	}

}


