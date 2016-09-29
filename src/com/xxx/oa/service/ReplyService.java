package com.xxx.oa.service;


import java.util.List;

import com.xxx.oa.base.BaseDao;
import com.xxx.oa.domain.Reply;
import com.xxx.oa.domain.Topic;

public interface ReplyService extends BaseDao<Reply>{
	
	/**
	 * query specific topic and sort it	(top  reply is the earliest)
	 * @param topic
	 * @return
	 */
	List<Reply> findByTopic(Topic topic);


}
