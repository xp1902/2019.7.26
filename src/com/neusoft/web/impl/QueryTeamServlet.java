package com.neusoft.web.impl;

public final class QueryTeamServlet extends TeamControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryTeam";
	}
}
