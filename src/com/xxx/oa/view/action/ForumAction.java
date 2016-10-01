package com.xxx.oa.view.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.xxx.oa.base.BaseAction;
import com.xxx.oa.domain.Forum;
import com.xxx.oa.domain.PageBean;
import com.xxx.oa.domain.Topic;
import com.xxx.oa.service.ForumService;
@Controller
@Scope("prototype")
public class ForumAction extends BaseAction<Forum>{
	/*ForumList*/
	public String list() throws Exception{
		List <Forum> forumList= forumService.findAll();
		ActionContext.getContext().put("forumList", forumList);
		return "list";
	}
	/** Simple Forum(theme list)*/
	public String show() throws Exception{
		
		// forum
		Forum forum= forumService.getById(model.getId());
		ActionContext.getContext().put("forum", forum);
		System.out.println(forum);
		
		//  topiclist
		/*List <Topic> topicList= topicService.findByForum(forum);
		ActionContext.getContext().put("topicList", topicList);
		
		// prepare topic data for pagination
		PageBean pageBean = topicService.getPageBean(pageNum,forum);
		ActionContext.getContext().getValueStack().push(pageBean);*/
		
		String hql="FROM Topic t where t.forum=? ORDER BY (CASE t.type WHEN 2 THEN 2 ELSE 0 END) DESC ,t.lastUpdateTime DESC";
		Object [] parameters= new Object[]{forum};
		PageBean pageBean = replyService.getPageBean(pageNum, hql, parameters);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "show";
		
		
	}
	
	
}
