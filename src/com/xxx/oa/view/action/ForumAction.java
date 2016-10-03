package com.xxx.oa.view.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.xxx.oa.base.BaseAction;
import com.xxx.oa.domain.Forum;
import com.xxx.oa.domain.PageBean;
import com.xxx.oa.domain.Topic;
@Controller
@Scope("prototype")
public class ForumAction extends BaseAction<Forum>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8790423350836384359L;

	/**
	 * 0 represent  all topics <br>
	 * 1 represent  gorgeous topics
	 */
	private int viewType=0;
	
	/**
	 * default sort  orderBy=0;<br>
	 * last update   .......=1;<br>
	 * created time of topoc=2;<br>
	 * count of reply.......=3; <br>
	 */
	
	/**
	 * true represent <br>
	 * false represent 
	 */
	private boolean asc=false;
	
	
	public boolean isAsc() {
		return asc;
	}
	public void setAsc(boolean asc) {
		this.asc = asc;
	}
	private int orderBy=0;
	
	public int getViewType() {
		return viewType;
	}
	public void setViewType(int viewType) {
		this.viewType = viewType;
	}
	public int getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(int orderBy) {
		this.orderBy = orderBy;
	}
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
		
		// prepare topic's data for pagination
		PageBean pageBean = topicService.getPageBean(pageNum,forum);
		ActionContext.getContext().getValueStack().push(pageBean);*/
		
		
		//prepare topic's data for pagination(be used in public)
		/*String hql="FROM Topic t where t.forum=? ORDER BY (CASE t.type WHEN 2 THEN 2 ELSE 0 END) DESC ,t.lastUpdateTime DESC";
		Object [] parameters= new Object[]{forum};
		PageBean pageBean = replyService.getPageBean(pageNum, hql, parameters);
		ActionContext.getContext().getValueStack().push(pageBean);*/
		
		
		//===============================================================
		//prepare topic's data for pagination(be used in public + filter + sort)
		List <Object> parameters = new ArrayList<Object>();
		String hql="FROM Topic t WHERE t.forum=? ";
		parameters.add(forum);
		
		// option of filter 
		if(viewType==1){
			hql+=" AND t.type=? " ;
			parameters.add(Topic.TYPE_BEST);
		}
		// option of sort
		if(orderBy==0){
				hql+= "ORDER BY (CASE t.type WHEN 2 THEN 2 ELSE 0 END) DESC ,t.lastUpdateTime DESC";
		}else if(orderBy==1){
			hql+= "ORDER BY t.lastUpdateTime "+(asc ? "ASC" : " DESC ");				
		}else if(orderBy==2){
			hql+= "ORDER BY t.postTime " +(asc ? "ASC" : " DESC ");				
			
		}else if(orderBy==3){
			hql+= "ORDER BY t.replyCount " +(asc ? "ASC" : " DESC ");				
			
		}
		PageBean pageBean = replyService.getPageBean(pageNum, hql, parameters.toArray());
		ActionContext.getContext().getValueStack().push(pageBean);
		
		//======================================================================
		return "show";
		
		
	}
	
	
}
