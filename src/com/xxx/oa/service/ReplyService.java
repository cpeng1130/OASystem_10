package com.xxx.oa.service;


import java.util.List;

import com.xxx.oa.base.BaseDao;
import com.xxx.oa.domain.PageBean;
import com.xxx.oa.domain.Reply;
import com.xxx.oa.domain.Topic;

public interface ReplyService extends BaseDao<Reply>{
	
	/**
	 * query specific topic and sort it	(top reply is the earliest)
	 * @param topic
	 * @return
	 */
	@Deprecated
	List<Reply> findByTopic(Topic topic);

	/**
	 * Get pagination information
	 * @param pageNum
	 * @param topic
	 * @return
	 */
	PageBean getPageBean(int pageNum, Topic topic);


}
