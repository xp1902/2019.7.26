package com.neusoft.web.impl;

public class AddTeamServlet extends TeamControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addTeam", "����");
		this.update("addVol","����");
		this.savePageInstance();
		return "zhiyuanTuandui";
	}

}
