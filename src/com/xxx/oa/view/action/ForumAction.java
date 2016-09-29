package com.xxx.oa.view.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.xxx.oa.base.BaseAction;
import com.xxx.oa.domain.Forum;
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
		
		
		//  topiclist
		List <Topic> topicList= topicService.findByForum(forum);
		ActionContext.getContext().put("topicList", topicList);
		return "show";
	}
	
	
}
