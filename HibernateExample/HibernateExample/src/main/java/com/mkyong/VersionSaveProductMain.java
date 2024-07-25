package com.mkyong;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.mkyong.user.DBProduct;

public class VersionSaveProductMain {
	public static void main(String[] args)
    {

        Configuration cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml"); 

        SessionFactory factory = cfg.buildSessionFactory();
        Session session = factory.openSession();
        DBProduct p=new DBProduct(); 

        p.setProductId(104);
        p.setProName("AC");
        p.setPrice(14000);

        Transaction tx = session.beginTransaction();
        session.save(p);
        System.out.println("Object saved successfully.....!!");
        tx.commit();
        session.close();
        factory.close();
    }

}
