package com.xxx.oa.view.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.xxx.oa.base.BaseAction;
import com.xxx.oa.domain.Reply;
@Controller
@Scope("prototype")
public class ReplyAction extends BaseAction<Reply> {
	/**
	 *  new Reply page
	 * */
	public String addUI()throws Exception{
		return "addUI";
	}
	/**
	 * new Reply
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception{
		return "toTopicshow"; // back to relative topic page
	}
}
