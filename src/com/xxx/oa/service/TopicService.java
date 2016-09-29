package com.xxx.oa.service;


import java.util.List;

import com.xxx.oa.base.BaseDao;
import com.xxx.oa.domain.Forum;
import com.xxx.oa.domain.Topic;

public interface TopicService extends BaseDao<Topic>{

	
	/**
	 * find specific topic ,sort by time(type-top is in the top area)
	 * @param forum
	 * @return list 
	 */
	List<Topic> findByForum(Forum forum);


}
