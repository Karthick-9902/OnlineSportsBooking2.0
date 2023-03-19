package com.bmg.util;

import javax.servlet.annotation.WebServlet;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
@WebServlet(loadOnStartup =  1)
public class HibernateUtil {
    static Configuration configuration = null;
    static SessionFactory sessionFactory = null;
    static Session session = null;
    static {
    	try {
    		configuration = new Configuration();
    		configuration.configure("hibernate.cfg.xml");
    		sessionFactory = configuration.buildSessionFactory();
    	}catch (HibernateException he) {
         he.printStackTrace();
    	}catch (Exception e) {
e.printStackTrace();		}
    	
    }
    
    public static Session getSession() {
		if(session == null) {
			return sessionFactory.openSession();
		}
		return session;
	}
//    public static void closeSession(Session session) {
//    	if(session != null) {
//    		session.close();
//    	}
//		
//	}
//    public static void closeSessionFactory() {
//		if(sessionFactory != null) {
//			sessionFactory.close();
//		}
//    }
}
