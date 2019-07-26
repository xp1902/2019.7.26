package com.neusoft.web.impl;

public class DelTeamServlet extends TeamControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("delTeam", "ÍË³ö");
		this.savePageInstance();
		return "zhiyuanTuandui";
	}

}
