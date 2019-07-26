package com.neusoft.web.impl;

public class QueryAllTDailyServlet extends DailyControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.savePageDataForToday();
		return "queryAllTDaily";
	}
}