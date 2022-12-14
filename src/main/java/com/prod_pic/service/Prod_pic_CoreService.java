package com.prod_pic.service;
import org.hibernate.Session;
import org.hibernate.Transaction;

import static com.util.HibernateUtil.*;

public interface Prod_pic_CoreService {
	default Transaction beginTransaction() {
		return getSession().beginTransaction();
	}
	default void commit() {
		getSession().getTransaction().commit();
	}
	default  void rollback() {
		getSession().getTransaction().rollback();
	}
	default Session getSession() {
		return getSessionFactory().getCurrentSession();
	};
}
