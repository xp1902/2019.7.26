package com.neusoft.web.impl;

public class DelTeamServlet extends TeamControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("delTeam", "�˳�");
		this.savePageInstance();
		return "zhiyuanTuandui";
	}

}
