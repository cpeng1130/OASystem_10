package com.xxx.oa.service.impl;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xxx.oa.base.BaseDaoImpl;
import com.xxx.oa.domain.Forum;
import com.xxx.oa.domain.Topic;
import com.xxx.oa.service.TopicService;
@Service
@Transactional
public class TopicServiceImpl extends BaseDaoImpl<Topic> implements TopicService {

	@Override
	public List<Topic> findByForum(Forum forum) {
		
		return getSession().createQuery(
				"FROM Topic t where t.forum=? ORDER BY (CASE t.type WHEN 2 THEN 2 ELSE 0 END) DESC ,t.lastUpdateTime DESC")
				.setParameter(0, forum)
				.list();
	}
	@Override
	public void save(Topic topic){
		// 1.set attribute 
		
		topic.setType(topic.TYPE_NORMAL);
		topic.setLastReply(null);
		topic.setReplyCount(0);
		topic.setLastUpdateTime(topic.getPostTime());
		getSession().save(topic);
		// 2. set relative information
		
		Forum forum=topic.getForum();
		forum.setTopicCount(forum.getTopicCount()+1);
		forum.setArticleCount(forum.getArticleCount()+1);
		forum.setLastTopic(topic);
		getSession().update(forum);
		
	}

}
