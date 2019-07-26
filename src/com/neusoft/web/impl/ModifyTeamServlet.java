package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class ModifyTeamServlet extends TeamControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyTeam", "ÐÞ¸Ä");
		this.savePageInstance();
		return "zhiyuanTuandui";
	}

}
