package com.pub.dao;

import java.util.List;

import com.pub.entity.Pub;
import com.pub.service.CoreDao;

public interface Pub_DAO extends CoreDao<Pub, Integer> {
	List<Pub> getMemAll(Integer mem_no);
	List<Pub> getAllbyOpen();
}
