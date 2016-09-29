package com.xxx.oa.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xxx.oa.base.BaseDaoImpl;
import com.xxx.oa.domain.Reply;
import com.xxx.oa.domain.Topic;
import com.xxx.oa.service.ReplyService;
@Service
@Transactional
public class ReplyServiceImpl extends BaseDaoImpl<Reply> implements ReplyService {

	@SuppressWarnings("unchecked")
	@Override
	public List<Reply> findByTopic(Topic topic) {
		return getSession().createQuery("FROM Reply r WHERE r.topic=? ORDER BY r.postTime ASC")
				.setParameter(0, topic)
				.list();
	}


}
