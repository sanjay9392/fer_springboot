package com.mkyong;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.mkyong.user.DBProduct;

public class PojoEx {
	public static void main(String[] args)
	{

		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml"); 

		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();

         // Transient state_____start
		DBProduct p=new DBProduct();
		//p.setProductId(101);
		p.setProName("Mobile");
		p.setPrice(25000);
         // Transient state_____end

         // Persistent state_____start
		Transaction tx = session.beginTransaction();
		session.save(p);
		System.out.println("Object saved successfully.....!!");
		tx.commit();
         // Persistent state_____end  

		session.close();
		factory.close();
	}

}
