package com.mkyong;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.mkyong.user.DBProduct;
import com.mkyong.user.DBWrapper;

public class WrapperMain {
	  public static void main(String[] args)
	    {
	        Configuration cfg = new Configuration();
	        cfg.configure("hibernate.cfg.xml"); 

	        SessionFactory factory = cfg.buildSessionFactory();
	        Session session = factory.openSession();
	        DBWrapper p=new DBWrapper(); 

	       // p.setProductId(9);
	        p.setProName("watch");
	        //p.setPrice(35000);       see am not setting any value to Price

	        Transaction tx = session.beginTransaction();
	        session.save(p);
	        System.out.println("Object saved successfully.....!!");
	        tx.commit();
	        session.close();
	        factory.close();
	    }

}
