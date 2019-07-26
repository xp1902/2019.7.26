package com.neusoft.web.impl;

public class BddTeamServlet extends TeamControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addTeam";
	}

}
