package com.pub.model;

import java.util.List;

import com.pub.service.CoreDao;

public interface Pub_DAO_H extends CoreDao<Pub, Integer> {
	List<Pub> getMemAll(Integer mem_no);
}
