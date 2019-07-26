package com.neusoft.web.impl;

public class AddTeamServlet extends TeamControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addTeam", "创建");
		this.update("addVol","创建");
		this.savePageInstance();
		return "zhiyuanTuandui";
	}

}
